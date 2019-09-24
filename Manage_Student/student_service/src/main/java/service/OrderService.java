package service;

import org.apache.ibatis.annotations.Param;
import pojo.Classroom;
import pojo.Ordercr;
import pojo.Student;

import java.util.Date;
import java.util.List;

public interface OrderService {

    public void addOrder(Ordercr ordercr);

    public void updateOrderById(Ordercr ordercr);

    public void deleteOrderById(Integer orderId);

    public List<String> getFacultyList();

    public List<Ordercr> getOrderList();

    public List<Ordercr> getOrderList(String snum);

    public List<Ordercr> getOrderList(String snum, Integer page);

    public boolean withdrawApplication(Integer orderid);

    public void updateApplication(List<Ordercr> ordercrs, String snum);

    public List<Ordercr> getOrderList(String snum, String cid, String startdate, Integer page);

    public boolean isOrdered(String cid, String starttime, String endtime);

    public boolean isBeforeTime(Date date, String starttime, String endtime);

    //今天是否已成功预订过一次教室(包含申请中和同意两种状态)
    public boolean hasOrderedToday(String snum);

    //自动取消该用户当天其余订单
    public void otherOrderCancel(String snum);

    public void acceptFirstApplication(String snum);

    public Integer orderCount(String snum, String cid, String startdate);

    public Ordercr getOrderById(Integer orderid);

    public Integer getAcceptOrderCount();

    public void alreadyUsed(Integer orderid);

    public Integer hasOrderedTheDay(String snum, String startdate);

}
