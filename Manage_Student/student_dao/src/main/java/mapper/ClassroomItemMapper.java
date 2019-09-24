package mapper;

import org.apache.ibatis.annotations.Param;
import pojo.Classroom;

import java.util.List;

public interface ClassroomItemMapper {

    List<Classroom> getClassroomItemList();

    List getClassroomListSingleDay(@Param("cid") String cid, @Param("startdate") String startdate);

}
