package service;



import pojo.OrderItem;
import pojo.Ordercr;

import java.util.List;

public interface OrderService
{
    List<OrderItem> getOrderList();
    void  changeOption(Integer oid,Integer option);
}
