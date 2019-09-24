package mapper;

import pojo.PageBean;
import pojo.Student;

import java.util.List;

public interface StudentItemMapper
{
    List<Student> getPageBean(PageBean pageBean);
    Integer getStudentTotalCount();
}
