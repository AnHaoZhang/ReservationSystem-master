package mapper;

import org.apache.ibatis.annotations.Param;
import org.w3c.dom.ls.LSInput;
import pojo.Classroom;
import pojo.ClassroomExample;
import pojo.PageBean;

import java.util.List;

public interface ClassroomMapper {
    int countByExample(ClassroomExample example);

    int deleteByExample(ClassroomExample example);

    int deleteByPrimaryKey(String cid);

    int insert(Classroom record);

    int insertSelective(Classroom record);

    List<Classroom> selectByExample(ClassroomExample example);

    Classroom selectByPrimaryKey(String cid);

    int updateByExampleSelective(@Param("record") Classroom record, @Param("example") ClassroomExample example);

    int updateByExample(@Param("record") Classroom record, @Param("example") ClassroomExample example);

    int updateByPrimaryKeySelective(Classroom record);

    int updateByPrimaryKey(Classroom record);
    List<Classroom> selectAll();
    List<Classroom> selectPageBean(PageBean pageBean);
    Integer getTotalCount();
    List<Classroom> getClassroomIdList(PageBean pageBean);
}