package service;

import pojo.*;

import java.util.List;

public interface AdminReservationService
{



    AdminOrderPageBean getPageBean(Integer pageSize, Integer currentPage, String orderDate, String cid);

    boolean insertOrderAdmin(Ordercr orderAdmin, String startTime, String endTime, String orderDay);


    boolean selectOrderByDateAndCid(Ordercr orderAdmin, String startTime, String endTime, String orderDay);

    String dateToWeek(String dateTime);
    List<Classroom> getAllClassroom();
    List<Faculty> getAllFaculty();

    void changeStatus(Integer option, Integer orderid);
}
