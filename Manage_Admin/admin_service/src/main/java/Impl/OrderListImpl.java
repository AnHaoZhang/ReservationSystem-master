package Impl;


import mapper.OrderItemMapper;
import mapper.OrdercrMapper;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.OrderItem;
import pojo.Ordercr;
import service.OrderService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OrderListImpl implements OrderService
{
    @Value("${MAX_TIME}")
    private  Integer maxTime;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private OrdercrMapper orderMapper;
    @Override
    public List<OrderItem> getOrderList()
    {
        /*

         * @Author: shize duan




         * @param :

         * @return :   返回预约信息

         * @Description:

         *  从数据库中取出预约信息并且根据时间判断并且修改预约状态

         */
        List<OrderItem> orderItemList = orderItemMapper.getOrderItemList();
       // System.out.println(orderItemList.size());
        for(int i=0;i<orderItemList.size();i++)
        {
            //判断并且更改预约状态
            SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");

            try
            {
                //6小时为21600秒
                String createTime = orderItemList.get(i).getCreatetime();
                Date createDate = dateFormat.parse(createTime);
                String endTime=orderItemList.get(i).getEndtime();
                Date endDate=dateFormat.parse(endTime);
                Date nowDate=new Date();
                //当状态为  2 拒绝 3 撤销 4 已使用 的时候不需要修改状态
                // 当订单生成时候状态为 0

                if(orderItemList.get(i).getOrderstatus()==2||orderItemList.get(i).getOrderstatus()==3||orderItemList.get(i).getOrderstatus()==4)
                {
                    continue;
                }
                //同意
                Long interval=nowDate.getTime()-createDate.getTime();
           /*
                测试时间间隔
                System.out.println(nowDate.getTime());
                System.out.println(createDate.getTime());
                System.out.println(interval);*/
                if(orderItemList.get(i).getOrderstatus()==0&&interval>maxTime)
                {
                    orderItemList.get(i).setOrderstatus(1);
                    orderItemMapper.updateOrderStatus(orderItemList.get(i).getOrderid(),1);
                }
                //设置为已经使用
                if (orderItemList.get(i).getOrderstatus()==1&&(nowDate.getTime()>endDate.getTime()))
                {
                    orderItemList.get(1).setOrderstatus(4);
                    orderItemMapper.updateOrderStatus(orderItemList.get(i).getOrderid(),4);

                }
            } catch (ParseException e)
            {
                e.printStackTrace();
            }
        }
        return orderItemList;
    }

    @Override
    //管理员修改预约状态
    public void changeOption(Integer oid, Integer option)
    {
        /*

         * @Author: shize duan

         * @param : oid 预约信息的id option 修改操作

         * @return :

         * @Description:

         * 管理员学生预约的状态操作

         */
        Ordercr item = orderMapper.selectByPrimaryKey(oid);
        item.setOrderstatus(option);
        orderMapper.updateByPrimaryKeySelective(item);
    }
}
