package Impl;

import mapper.OrderItemMapper;
import mapper.OrdercrMapper;
import mapper.StudentMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Classroom;
import pojo.Ordercr;
import service.OrderService;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrdercrMapper ordercrMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public void addOrder(Ordercr ordercr) {
        ordercrMapper.insert(ordercr);
    }

    @Override
    public void updateOrderById(Ordercr ordercr) {
        ordercrMapper.updateByPrimaryKey(ordercr);
    }

    @Override
    public void deleteOrderById(Integer orderId) {
        ordercrMapper.deleteByPrimaryKey(orderId);
    }

    @Override
    public List<String> getFacultyList() {
        List<String> facultyList = orderItemMapper.getFacultyItemList();
        return facultyList;
    }


    /*

     * @Author: Zhancheng Liang

     * @param :

     * @return :    全部订单

     * @Description:查找全部订单

     *

     */
    @Override
    public List<Ordercr> getOrderList() {
        List<Ordercr> list = orderItemMapper.getOrderList();
        return list;
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  学号snum，当前页数page

     * @return :    ordercrList订单列表

     * @Description: 查询学号为snum的用户所有订单

     *

     */
    @Override
    public List<Ordercr> getOrderList(String snum, Integer page) {
        List<Ordercr> ordercrList = orderItemMapper.getOrderItemListByPage(snum, 8 * (page - 1), 8);
        return ordercrList;
    }

    @Override
    public List<Ordercr> getOrderList(String snum) {
        List<Ordercr> ordercrList = orderItemMapper.getOrderItemList(snum);
        return ordercrList;
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  订单号orderid

     * @return :

     * @Description: 撤销申请

     *

     */
    @Override
    public boolean withdrawApplication(Integer orderid) {
        Ordercr ordercr = ordercrMapper.selectByPrimaryKey(orderid);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date createtime = df.parse(ordercr.getCreatetime());
            Date nowtime = df.parse(df.format(new Date()));

            Calendar calendar = Calendar.getInstance();
            Calendar createday = Calendar.getInstance();

            Date allowtime = createtime;//允许撤销时间
            calendar.setTime(allowtime);
            createday.setTime(createtime);
            calendar.add(createday.HOUR_OF_DAY, 6);//允许撤销时间 = 创建订单时间 + 6小时
            allowtime = calendar.getTime();

            if (nowtime.compareTo(allowtime) < 0) {
                //当前时间在允许撤销时间范围内
                ordercr.setOrderstatus(3);
                orderItemMapper.updateOrderStatus(ordercr);
                return true;
            } else if (ordercr.getOrderstatus() == 0) {
                ordercr.setOrderstatus(1);
                orderItemMapper.updateOrderStatus(ordercr);
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  订单号

     * @return :

     * @Description: 订单超过六小时自动同意

     *

     */
    @Override
    public void updateApplication(List<Ordercr> ordercrs, String snum) {
        int count = 1;
        for (Ordercr ordercr : ordercrs) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                Date createtime = df.parse(ordercr.getCreatetime());
                Date nowtime = df.parse(df.format(new Date()));
                Date starttime = df.parse(ordercr.getStarttime());

                Calendar calendar = Calendar.getInstance();
                Calendar createday = Calendar.getInstance();

                Date allowtime = createtime;//允许撤销时间
                calendar.setTime(allowtime);
                createday.setTime(createtime);
                calendar.add(createday.HOUR_OF_DAY, 6);//允许撤销时间 = 创建订单时间 + 6小时
                allowtime = calendar.getTime();

                if ((nowtime.compareTo(allowtime) >= 0 || (nowtime.compareTo(starttime)) >= 0) && ordercr.getOrderstatus() == 0) {
                    Date date = new Date();
                    DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
                    if (count == 1) {
                        Integer zeroStatus = orderItemMapper.orderStatusCount(snum, df1.format(new Date()));
                        if (zeroStatus == 1) {
                            orderItemMapper.acceptFirstApplication(df1.format(date), snum);
                        }
                        if (zeroStatus != 1) {
                            //申请中的数目不为1，则判断更改状态
                            orderItemMapper.acceptFirstApplication(df1.format(date), snum);
                            orderItemMapper.cancelOtherOrder(df1.format(date), snum);
                        }
                        count++;
                    }
//                    ordercr.setOrderstatus(1);
//                    orderItemMapper.updateOrderStatus(ordercr);
                } else if (ordercr.getOrderstatus() == 1 && nowtime.compareTo(starttime) >= 0) {
                    ordercr.setOrderstatus(4);
                    orderItemMapper.updateOrderStatus(ordercr);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /*

     * @Author: Zhancheng Liang

     * @param : 学号，日期

     * @return :    订单列表

     * @Description: 查询某个学生的某天的订单

     *

     */
    @Override
    public List getOrderList(@Param("snum") String snum, @Param("cid") String cid, @Param("startdate") String startdate, @Param("page") Integer page) {
        List list = new ArrayList<>();

        if (cid.equals("all") && startdate.equals("")) {
            list = orderItemMapper.getOrderItemListByPage(snum, 8 * (page - 1), 8);
        } else if (cid.equals("all") && !startdate.equals("")) {
            list = orderItemMapper.selectByExample(snum, "", startdate, 8 * (page - 1), 8);
        } else {
            list = orderItemMapper.selectByExample(snum, cid, startdate, 8 * (page - 1), 8);
        }

        return list;
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  教室号，开始时间，结束时间

     * @return :  boolean

     * @Description: 判断该教室的时间段是否已经被预订

     *

     */
    @Override
    public boolean isOrdered(String cid, String starttime, String endtime) {
        List<Ordercr> orderList = orderItemMapper.selectOrderByCid(cid);
//        DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  //12小时制
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    //24小时制
        try {

            //现在申请的时间段
            Date t_start = df.parse(starttime);
            Date t_end = df.parse(endtime);

            for (Ordercr order : orderList) {
                //数据库里已申请的时间段
                Date db_start = df.parse(order.getStarttime());
                Date db_end = df.parse(order.getEndtime());

                //默认t_start(db_start) < t_end(db_end)
                if (!(t_end.compareTo(db_start) <= 0 || t_start.compareTo(db_end) >= 0)) {
                    //申请的结束时间早于数据库中的开始时间 或 申请的开始时间晚于数据库中的结束时间才可通过验证
                    return true;    //已被预订
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
        return false;   //未被预定
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  现在日期，开始时间，结束时间

     * @return :    Boolean

     * @Description:判断选择的开始/结束时间是否为现在时刻之前的时间

     *

     */
    @Override
    public boolean isBeforeTime(Date date, String starttime, String endtime) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date start = df.parse(starttime);
            Date end = df.parse(endtime);
            Date now = df.parse(df.format(new Date()));
            if (start.compareTo(now) <= 0 || end.compareTo(now) <= 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
        return false;
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  今天日期，订单创建日期，学号

     * @return :    boolean

     * @Description:判断此用户今天是否已预订过一次教室

     *

     */
    @Override
    public boolean hasOrderedToday(String snum) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            String now = df.format(new Date());
            if (orderItemMapper.hasOrderedToday(now, snum) != 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
        return false;
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  学号

     * @return :

     * @Description:取消该用户预定成功的其他订单

     *

     */
    @Override
    public void otherOrderCancel(String snum) {
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        orderItemMapper.cancelOtherOrder(df.format(date), snum);
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  学号

     * @return :

     * @Description:取消该用户预定成功的其他订单

     *

     */

    @Override
    public void acceptFirstApplication(String snum) {
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        orderItemMapper.acceptFirstApplication(df.format(date), snum);
    }

    /*

     * @Author: Zhancheng Liang

     * @param : 学号

     * @return :    Integer

     * @Description: 统计该用户订单总数

     *

     */
    @Override
    public Integer orderCount(String snum, String cid, String startdate) {
        return orderItemMapper.messageCounter(snum, cid, startdate);
    }

    @Override
    public Ordercr getOrderById(Integer orderid) {
        return ordercrMapper.selectByPrimaryKey(orderid);
    }

    @Override
    public Integer getAcceptOrderCount() {
        return orderItemMapper.getAcceptApplications();
    }

    @Override
    public void alreadyUsed(Integer orderid) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = df.format(new Date());
        orderItemMapper.alreadyUsed(orderid, now);
    }

    @Override
    public Integer hasOrderedTheDay(String snum, String startdate) {
        return orderItemMapper.hasOrderedTheDay(snum, startdate);
    }


}
