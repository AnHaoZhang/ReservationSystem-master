package service;

import pojo.PageBean;
import pojo.Student;

import java.util.List;

public interface StudentService
{
    PageBean getStudentPageBean(String sid, Integer pageSize, Integer currentPage);

}
