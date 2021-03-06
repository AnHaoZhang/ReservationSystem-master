package Impl;

import mapper.OrderItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import pojo.ActivityPageBean;
import pojo.OrderItem;
import redis.clients.jedis.Jedis;
import service.ActivityService;
import service.ActivityService1;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional
public class ActivityServiceImpl1 implements ActivityService1
{
    @Autowired
    private OrderItemMapper orderItemMapper;

    @Override
    public ActivityPageBean getActivityPageBean(Integer pageSize, Integer currentPage, String nowDate) throws ParseException {
        /*

         * @Author: shize duan

         * @param : pageSIze 页面显示条数 currentPage 当前页面数 nowDate 当天日期

         * @return : ActivityPageBean 页面信息所需要的pageBean

         * @Description:

         * 当nowDate为空时从全部信息获取的页面信息 当nowDate!= null 时 通过日期筛选后获得

         */
        String date;
        ActivityPageBean activityPageBean;
        if(nowDate!=null&&(!StringUtils.isEmpty(nowDate)))
        {
            date=nowDate;
        }
        else
        {
            SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
            date=dateFormat.format(new Date());
        }
        //一天最晚预定时间
        date+=" 00:00:00";
        String endDate=date.substring(0,10)+" 24:00:00";
        int totalCount = orderItemMapper.getActivityTotalCount(date,endDate);
     //   System.out.println(totalCount);
        activityPageBean=new ActivityPageBean(pageSize,currentPage,totalCount);
        Integer start=(activityPageBean.getCurrentPage()-1)*activityPageBean.getPageSize();
        activityPageBean.setStart(start);
        activityPageBean.setNowDate(date);
        activityPageBean.setEndDate(endDate);

        List<OrderItem> orderItemList = new ArrayList<>();
        Jedis jedis = new Jedis("10.16.25.7",6379);
        Set<String> keys = jedis.keys("*");
        Object[] objects = keys.toArray();

        for(int i=0;i<=5;i++){
            OrderItem a = new OrderItem();
            if(i+start>keys.size()){
                break;
            }
            //获取第二天时间
            Calendar calendar = Calendar.
                    getInstance();
            calendar.setTime(
                    new
                            Date());
            calendar.set(Calendar.
                    HOUR_OF_DAY, 0);
            calendar.set(Calendar.
                    MINUTE, 0);
            calendar.set(Calendar.
                    SECOND, 0);
            calendar.set(Calendar.
                    MILLISECOND, 0);
            calendar.add(Calendar.
                    DAY_OF_MONTH, 1);
            Date date2 =new Date();
            date2 = calendar.getTime();
            //获取今天时间
            Date d = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dateNowStr = sdf.format(d);
            String dateNowStr2 = sdf.format(date2);
            a.setStarttime(jedis.hget((String) objects[i+start], "starttime"));
            a.setEndtime(jedis.hget((String) objects[i+start], "endtime"));
            a.setCid(jedis.hget((String) objects[i+start], "cid"));
            a.setTheme(jedis.hget((String) objects[i+start], "theme"));
            a.setGroupname(jedis.hget((String) objects[i+start], "group"));
            Date date1=sdf.parse(a.getStarttime());
             d=sdf.parse(dateNowStr);
             date2=sdf.parse(dateNowStr2);
            System.out.println(date1+" "+date2+" "+d);
            if(date1.before(d)||date1.after(date2)){
                continue;
            }
            orderItemList.add(a);
        }

//        List<OrderItem> orderItemList = orderItemMapper.getActivityPageBean(activityPageBean);
   //     System.out.println(orderItemList.size());
        activityPageBean.setPageList(orderItemList);
        activityPageBean.setNowDate(date.substring(0,10));
        return  activityPageBean;
    }



}
