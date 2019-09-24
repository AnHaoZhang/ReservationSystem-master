package service;

import org.apache.ibatis.annotations.Param;
import pojo.Classroom;

import java.util.List;

public interface ClassroomService {
    public List<Classroom> getClassroomList();

    public Classroom getClassroomByCid(String cid);

    public List<Classroom> getClassroomList(@Param("cid") String cid, @Param("startdate") String startdate);

    public Integer getClassroomCount(@Param("cid") String cid);
}
