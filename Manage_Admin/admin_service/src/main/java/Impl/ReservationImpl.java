package Impl;

import mapper.ClassroomMapper;
import mapper.OrderItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import pojo.*;
import service.ReservationService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional
public class ReservationImpl implements ReservationService
{
    @Autowired
    private ClassroomMapper classroomMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Override
    public PageBean getOrderTimeTableList(Integer pageSize, Integer currentPage, String cid , String orderDate)
    {
        /*

         * @Author: shize duan

         * @param : pageSize 页面展示信息的条数 currentPage 页面当前页码 cid 教室编号 orderDate 查询预约信息的日期(默认为今天)

         * @return : pageBean 封装了页面所要的信息

         * @Description:

         * 获取页面所需要的所有信息

         */
        //修改测试pageBean

        pageSize=15;
        if(orderDate==null||StringUtils.isEmpty(orderDate))
        {
            SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
            orderDate=dateFormat.format(new Date());
        }
        //初始orderItemTimeTable
        List<OrderTimeTable> orderTimeTableList=new ArrayList<>();

        //借助pageBean关于信息的验证获取教室编号列表
        PageBean pageBean;
        //初始化教室列表
        List<Classroom> classroomIdList=new ArrayList<>();
        //判断前端传递的cid 是否为空
        // 如果为空 即条件中不包含教室编号
        if(cid!=null&&(!StringUtils.isEmpty(cid)))
        {
            pageBean=new PageBean(pageSize,currentPage,1);
            Classroom classroom = classroomMapper.selectByPrimaryKey(cid);
            if(classroom==null)
            {
                return  pageBean;
            }
            classroomIdList.add(classroom);

        }
        else
        {
            Integer totalCount=classroomMapper.getTotalCount();
            pageBean=new PageBean(pageSize,currentPage,totalCount);
            Integer start=(pageBean.getCurrentPage()-1)*pageBean.getPageSize();
            pageBean.setStart(start);
            classroomIdList = classroomMapper.selectPageBean(pageBean);
        }
        //借助教室编号列表获取OrderTimeTable
        for (Classroom classroom:classroomIdList)
        {
            OrderTimeTable orderTimeTable = getOrderTimeTable(classroom.getCid(), orderDate);



            orderTimeTableList.add(orderTimeTable);
        }
        pageBean.setPageList(orderTimeTableList);
        return  pageBean;
    }

    @Override
    public OrderTimeTable getOrderTimeTable(String cid, String orderDate)
    {
        /*

         * @Author: shize duan

         * @param : cid 教室编号 orderDate 预约日期

         * @return:  返回当前教室编号对应日期下的预约信息

         * @Description:

         * 获取教室编号，日期对应下的信息

         */
        OrderTimeTable orderTimeTable=new OrderTimeTable();
        //设置查询的日期
        orderTimeTable.setOrderDate(orderDate);
        //设置查询的教室编号
        orderTimeTable.setCid(cid);
        //通过cid 以及日期模糊查询到与日期相关的预定数据
        List<OrderItem> orderList = orderItemMapper.getOrderItemByCidAndStartDate(cid, orderDate);
        ItemDate itemDate = getItemDate(orderDate, orderList);
        orderTimeTable.setItemDate(itemDate);
        return orderTimeTable;
    }

    @Override
    public ItemDate getItemDate(String orderDate, List<OrderItem> orderList)
    {
        /*

         * @Author: shize duan

         * @param : orderDate 预约信息日期

         * @return :

         * @Description:

         *

         */
        ItemDate itemDate=new ItemDate();
        //初始化记录表
         Integer count[]={0,0,0,0,0,0,0,0,0,0,0,0,0};
        //初始化 itemTimeList
        List<ItemTime> itemTimeList=new ArrayList<>();
        //初始化时间列表
        List<String> dateTableList = getDateTableList();
        //格式化时间精确到小时
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH");
        for(OrderItem orderItem:orderList)
        {
            String orderStartTime = orderItem.getStarttime();
            //如果当前的orderItemTime与itemDate中的日期不相同continue;
            if(!(orderStartTime.substring(0,10).equals(orderDate)))
            {
                continue;
            }
            ItemTime orderItemTime=new ItemTime();
            try
            {
                Calendar gregorianCalendar = new GregorianCalendar();
                Date start = dateFormat.parse(orderItem.getStarttime());
                Date end = dateFormat.parse(orderItem.getEndtime());
                //compareTo 比较两个日期的大小
                //如果start大 返回 1 相等 返回 0 小于返回 -1
                while (start.compareTo(end)==-1)
                {
                    String formatStart = dateFormat.format(start);
                   /* System.out.println(formatStart.substring(11,13));
                    System.out.println(dateTableList.indexOf(formatStart.substring(11,13)));*/
                    count[dateTableList.indexOf(formatStart.substring(11,13))]++;
                    gregorianCalendar.setTime(start);
                    gregorianCalendar.add(Calendar.HOUR, 1);
                    start = gregorianCalendar.getTime();
                }
            } catch (ParseException e)
            {
                e.printStackTrace();
            }
            orderItemTime.setStartTime(orderItem.getStarttime());
            orderItemTime.setEndTime(orderItem.getEndtime());
            //添加当前orderItem的时间信息
            itemTimeList.add(orderItemTime);

        }
        itemDate.setOrderTimeList(itemTimeList);
        itemDate.setDateCount(count);
        return  itemDate;
    }

    @Override
    public List<String> getDateTableList()
    {
        /*

         * @Author: shize duan

         * @param :

         * @return : 日期字符串表

         * @Description:

         * 初始化一个日期字符数组

         */
        final  String[] dateTable={"08","09","10","11","12","13","14","15","16","17","18","19","20","21"};
        ArrayList<String> arrayList=new ArrayList<String>();
        for (int i=0;i<dateTable.length;i++)
        {
            arrayList.add(dateTable[i]);
        }
        return  arrayList;
    }
}
