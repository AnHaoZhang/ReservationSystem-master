package service;

import pojo.Classroom;
import pojo.PageBean;


public interface ClassroomService
{
    void  deleteClassroom(String cid);
    Integer addClassroom(Classroom classroom);
    PageBean getPageBean(Integer pageSize,Integer currentPage,String cid);
    int getClassroomById(String cid);
    int checkClassroomExist(String cid);
}
