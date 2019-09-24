package service;

import pojo.*;

import java.util.List;

public interface ReservationService
{
    PageBean getOrderTimeTableList(Integer pageSize, Integer currentPage, String cid , String itemDate);

    OrderTimeTable getOrderTimeTable(String cid, String orderDate);

    ItemDate getItemDate(String orderDate, List<OrderItem> orderList);

    List<String> getDateTableList();
}
