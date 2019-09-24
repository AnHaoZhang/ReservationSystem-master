package mapper;


import org.apache.ibatis.annotations.Param;
import pojo.Classroom;
import pojo.Ordercr;

import java.util.List;

public interface OrderItemMapper {
    List<Ordercr> getOrderList();

    List getOrderItemListByPage(@Param("snum") String snum, @Param("offset") Integer offset, @Param("limit") Integer limit);

    List getOrderItemList(@Param("snum") String snum);

    List<String> getFacultyItemList();

//    List<Classroom> getClassroomItemList(@Param("cid") String cid, @Param("startdate") String startdate);

    void updateOrderStatus(Ordercr ordercr);

    List selectByExample(@Param("snum") String snum, @Param("cid") String cid, @Param("startdate") String startdate, @Param("offset") Integer offset, @Param("limit") Integer limit);

    List<Ordercr> selectOrderByCid(@Param("cid") String cid);

    Integer hasOrderedToday(@Param("createtime") String createtime, @Param("snum") String snum);

    Integer messageCounter(@Param("snum") String snum, @Param("cid") String cid, @Param("startdate") String startdate);

    void cancelOtherOrder(@Param("createtime") String createtime, @Param("snum") String snum);

    void acceptFirstApplication(@Param("createtime") String createtime, @Param("snum") String snum);

    Integer orderStatusCount(@Param("snum") String snum, @Param("createtime") String createtime);

    Integer getAcceptApplications();

    void alreadyUsed(@Param("orderid") Integer orderid, @Param("starttime") String starttime);

    Integer hasOrderedTheDay(@Param("snum") String snum, @Param("startdate") String startdate);

}
