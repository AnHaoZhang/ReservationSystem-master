package mapper;

import pojo.ActivityPageBean;
import pojo.OrderItem;
import pojo.Ordercr;
import pojo.PageBean;

import java.util.List;

public interface OrderItemMapper
{
    List<Ordercr> getOrderList();
    List<OrderItem> getOrderItemList();
    void  updateOrderStatus(Integer orderId, Integer orderStatus);
    List<OrderItem> getOrderItemTimeList();
    List<OrderItem> getOrderItemByCidAndStartDate(String cid,String startDate);
    List<OrderItem> getActivityPageBean(ActivityPageBean activityPageBean);
    Integer getActivityTotalCount(String nowDate,String endDate);
}
