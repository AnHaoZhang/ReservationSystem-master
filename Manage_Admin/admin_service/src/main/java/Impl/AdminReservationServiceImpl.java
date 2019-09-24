package Impl;

import mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import pojo.*;
import service.AdminReservationService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional
public class AdminReservationServiceImpl implements AdminReservationService
{
    @Value("${START_TIME}")
    private  String START_TIME;
    @Value("${END_TIME}")
    private  String END_TIME;
    @Autowired
    private OrdercrMapper ordercrMapper;
    @Autowired
    private ClassroomMapper classroomMapper;
    @Autowired
    private FacultyMapper facultyMapper;
    @Autowired
    private AdminOrderMapper adminOrderMapper;
    @Override
    public AdminOrderPageBean getPageBean(Integer pageSize, Integer currentPage, String orderDate, String cid)
    {
        /*

         * @Author: shize duan

         * @param : pageSize 页面显示条数 currentPage 当前页码 orderDate 预定日期 cid 教室编号

         * @return : AdminOrderPageBean 包含页面所需要的全部信息

         * @Description: 获取AdminOrderPageBean

         *

         */
        OrdercrExample ordercrExample=new OrdercrExample();
        OrdercrExample.Criteria criteria = ordercrExample.createCriteria();
        if(cid!=null&& !StringUtils.isEmpty(cid))
        {
            criteria.andCidEqualTo(cid);
        }
        if(orderDate!=null && !StringUtils.isEmpty(orderDate))
        {
            String orderStartTime=orderDate+" "+START_TIME;
            String orderEndTime=orderDate+" "+END_TIME;
      /*      System.out.println(orderStartTime);
            System.out.println(orderEndTime);*/
            criteria.andStarttimeBetween(orderStartTime,orderEndTime);
        }
        criteria.andSnumEqualTo("874492787");
        List<Ordercr> ordercrList = ordercrMapper.selectByExample(ordercrExample);
        int totalCount = ordercrList.size();
/*        System.out.println("totalCount : "+totalCount);*/
        AdminOrderPageBean pageBean=new AdminOrderPageBean(pageSize,currentPage,totalCount);
/*        System.out.println("pageBeanTotalCount : "+pageBean.getTotalCount());*/
        Integer start=(pageBean.getCurrentPage()-1)*pageBean.getPageSize();
        pageBean.setStart(start);
        pageBean.setCid(cid);
        pageBean.setOrderDate(orderDate);
/*        System.out.println(pageBean.getTotalPage());*/
        List<Ordercr> adminOrderList = adminOrderMapper.getAdminOrderPageBean(pageBean);

/*        System.out.println(adminOrderList.size());*/
        pageBean.setPageList(adminOrderList);
        return  pageBean;
    }

    @Override
    public boolean insertOrderAdmin(Ordercr orderAdmin, String startTime, String endTime, String orderDay)
    {
        /*

         * @Author: shize duan

         * @param : orderAdmin 预定所需要的部分信息 (startTime  endTime)(HH:mm 格式) orderDay 星期几

         * @return : false预定失败 true 成功

         * @Description:

         * 首先判断在预定的时间段内有没有被预定，如果时间段内有被预定的时间则返回错误信息，反之执行
         * 插入操作

         */
        if (selectOrderByDateAndCid(orderAdmin,startTime,endTime,orderDay))
        {
            String adminStartDate=orderAdmin.getStarttime();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            //日期字符串到日期类型的转换
            Date  startDate= null;
            try
            {
                startDate = format.parse(adminStartDate);
            } catch (ParseException e)
            {
                e.printStackTrace();
            }
            String  adminEndDate=orderAdmin.getEndtime();
            Date endDate= null;
            try
            {
                endDate = format.parse(adminEndDate);
            } catch (ParseException e)
            {
                e.printStackTrace();
            }
            if(startDate!=null&&endDate!=null)
            {
                //初始化order
                Ordercr orderItem=new Ordercr();
                orderItem.setCid(orderAdmin.getCid());
                orderItem.setCreatetime(orderAdmin.getCreatetime());
                orderItem.setFaculty(orderAdmin.getFaculty());
                orderItem.setGroupname(orderAdmin.getGroupname());
                orderItem.setOrderstatus(1);
                orderItem.setSnum(orderAdmin.getSnum());
                orderItem.setStelephone(orderAdmin.getTtelephone());
                orderItem.setTeacher(orderAdmin.getTeacher());
                orderItem.setTheme(orderAdmin.getTheme());
                orderItem.setAttendcount(orderAdmin.getAttendcount());
                orderItem.setTtelephone(orderAdmin.getTtelephone());
                orderItem.setDetails(orderAdmin.getDetails());
                //如果startDate大 返回 1 相等 返回 0 小于返回 -1
                while (startDate.compareTo(endDate) != 1)
                {
                    String orderStart = format.format(startDate);
             /*       System.out.println(orderStart);*/
                    if( !dateToWeek(orderStart).equals(orderDay))
                    {
                        Calendar gregorianCalendar = new GregorianCalendar();
                        gregorianCalendar.setTime(startDate);
                  /*      System.out.println(startTime);*/
                        gregorianCalendar.add(Calendar.DAY_OF_MONTH, 1);
                        startDate = gregorianCalendar.getTime();
                        continue;
                    }
                    String orderStartDate = orderStart + " "+startTime;
                    String orderEndDate = orderStart + " "+endTime;
               /*     System.out.println(orderItem.toString());*/
                    orderItem.setEndtime(orderEndDate);
                    orderItem.setStarttime(orderStartDate);
                    ordercrMapper.insertSelective(orderItem);
                    Calendar gregorianCalendar = new GregorianCalendar();
                    gregorianCalendar.setTime(startDate);
                    gregorianCalendar.add(Calendar.DAY_OF_MONTH, 1);
                    startDate = gregorianCalendar.getTime();
                }
            };
            return true;
        }
        return false;
    }

    @Override
    public boolean selectOrderByDateAndCid(Ordercr orderAdmin,String startTime,String endTime,String orderDay)
    {
        /*

         * @Author: shize duan

         * @param :  orderAdmin 预定所需要的部分信息 (startTime  endTime)(HH:mm 格式) orderDay 星期几

         * @return :  显示此时间段内有没有已经被预定的时间

         * @Description:

         * 筛选操作

         */
        //设置筛选状态
        List<Integer> status=new ArrayList<>();
        //只需要 申请中，同意，及其已使用状态下的预约条件
        //搜索条件设置
        status.add(0);
        status.add(1);
        status.add(4);

        String adminStartDate=orderAdmin.getStarttime();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        //日期字符串到日期类型的转换
        Date  startDate= null;
        try
        {
            startDate = format.parse(adminStartDate);
        } catch (ParseException e)
        {
            e.printStackTrace();
        }
        String  adminEndDate=orderAdmin.getEndtime();
        Date endDate= null;
        try
        {
/*            System.out.println(adminEndDate);*/
            endDate = format.parse(adminEndDate);
        } catch (ParseException e)
        {
            e.printStackTrace();
        }
       if(startDate!=null&&endDate!=null)
       {
           //如果startDate大 返回 1 相等 返回 0 小于返回 -1
         /*  System.out.println("orderDay : "+orderDay);*/
           while (startDate.compareTo(endDate) != 1)
           {
               ;
               String orderStart = format.format(startDate);
   /*            System.out.println("orderStart : "+orderStart);*/
               if( !dateToWeek(orderStart).equals(orderDay))
               {
                   Calendar gregorianCalendar = new GregorianCalendar();
                   gregorianCalendar.setTime(startDate);
                   gregorianCalendar.add(Calendar.DAY_OF_MONTH, 1);
                   startDate = gregorianCalendar.getTime();
                   continue;
               }
              //截取开始日期
               String orderStartDate = orderStart + " "+startTime;
               //截取结束日期
               String orderEndDate = orderStart + " "+endTime;
               OrdercrExample ordercrExample = new OrdercrExample();
               OrdercrExample.Criteria criteria = ordercrExample.createCriteria();
               //设置筛选日期
               criteria.andStarttimeGreaterThanOrEqualTo(orderStartDate);
               criteria.andEndtimeLessThanOrEqualTo(orderEndDate);
               criteria.andCidEqualTo(orderAdmin.getCid());

               criteria.andOrderstatusIn(status);
               List<Ordercr> orderList = ordercrMapper.selectByExample(ordercrExample);
               //判断此教室在此时间段内有没有已经使用
               if (orderList != null && orderList.size() != 0)
               {
    /*               for (Ordercr order:orderList)
                   {
                       System.out.println(order.toString());
                   }*/
                   return false;
               }
               Calendar gregorianCalendar = new GregorianCalendar();
               gregorianCalendar.setTime(startDate);
               gregorianCalendar.add(Calendar.DAY_OF_MONTH, 1);
               startDate = gregorianCalendar.getTime();
           /*    System.out.println("startDate : " +startDate);*/
           }
       }
        return true;
    }
    public  String dateToWeek(String dateTime) {
        /*

         * @Author: shize duan

         * @param : dateTime 日期  格式 yyyy-MM-dd

         * @return : 返回星期

         * @Description:

         * 通过日期获取当前日期是星期几

         */
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        Calendar cal = Calendar.getInstance(); // 获得一个日历
        Date datet = null;
        try {
            datet = f.parse(dateTime);
            cal.setTime(datet);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
        if (w < 0)
            w = 0;
        return weekDays[w];
    }

    @Override
    public List<Classroom> getAllClassroom()
    {
        return classroomMapper.selectAll();
    }

    @Override
    public List<Faculty> getAllFaculty()
    {
        return  facultyMapper.selectAll();
    }

    @Override
    public void changeStatus(Integer option, Integer orderid)
    {
        Ordercr orderItem = ordercrMapper.selectByPrimaryKey(orderid);
/*        System.out.println("orderId = "+ orderid );
        System.out.println("option : "+option);*/
        orderItem.setOrderstatus(option);
        ordercrMapper.updateByPrimaryKeySelective(orderItem);
    }
}
