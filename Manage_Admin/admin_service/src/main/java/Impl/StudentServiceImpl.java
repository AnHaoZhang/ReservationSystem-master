package Impl;

import mapper.StudentItemMapper;
import mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import pojo.Classroom;
import pojo.PageBean;
import pojo.Student;
import service.StudentService;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService
{
    @Autowired
    private StudentItemMapper studentItemMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public PageBean getStudentPageBean(String sid,Integer pageSize,Integer currentPage)
    {
        /*

         * @Author: shize duan

         * @param : sid 学号 pageSize 页面显示条数 currentPage 当前页码

         * @return : pageBean 包含学生的所有信息

         * @Description:

         * 获取学生信息

         */
        PageBean pageBean;
        if(sid!=null&&(!StringUtils.isEmpty(sid)))
        {
            Student student = studentMapper.selectByPrimaryKey(sid);
            List<Student> studentList=new ArrayList<>();
            studentList.add(student);
            pageBean=new PageBean(pageSize,1,1);
            pageBean.setPageList(studentList);
        }
        else
        {
            Integer totalCount=studentItemMapper.getStudentTotalCount();
            pageBean=new PageBean(pageSize,currentPage,totalCount);
            Integer start=(pageBean.getCurrentPage()-1)*pageBean.getPageSize();
            pageBean.setStart(start);
            List<Student> studentList = studentItemMapper.getPageBean(pageBean);
            pageBean.setPageList(studentList);
        }
        return  pageBean;
    }
}
