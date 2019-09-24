package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Classroom;
import pojo.PageBean;
import service.ClassroomService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ClassroomInformationController
{
    @Value("${CLASSROOM_PAGESIZE}")
    //页面信息条数设置
    private  Integer pageSize;
    @Autowired
    private ClassroomService classroomService;
    @RequestMapping("/admin/classroomInformation")
    public  String getClassroomInformation(String cid, Integer currentPage,  Model model)
    {
        /*

         * @Author: shize duan

         * @param : cid 教室编号 currentPage 当前页码

         * @return: 返回到classroomInformation.jsp页面

         * @Description:

         * 初始化页面操作

         */
        PageBean   pageBean= classroomService.getPageBean(pageSize, currentPage, cid);
        model.addAttribute("pageBean",pageBean);
        return "classroomInformation";
    }
    @RequestMapping("/admin/deleteClassroom")
    public  String deleteClassroom(String cid)
    {
        /*

         * @Author: shize duan

         * @param : cid 教室编号

         * @return : 跳转到classroomInformation.jsp页面

         * @Description:

         * 删除教室信息

         */
        classroomService.deleteClassroom(cid);
        return "redirect:classroomInformation.html";
    }
    @RequestMapping("/admin/addClassroom")
    @ResponseBody
    public  String addClassroom(String cid,Integer cnum,Model model)
    {
        /*

         * @Author: shize duan

         * @param : cid 要添加的教室编号 cnum 教室可容纳人数

         * @return : 当cid 或者cnum 为空时添加失败 返回 -1
         *           或者当 cid 已经存在数据库时添加失败

         * @Description:

         * 添加教室信息

         */
        Integer check=-1;
        if(cid==null||cnum==null|| StringUtils.isEmpty(cid)||StringUtils.isEmpty(cid))
        {
                return "fail";
        }

        if(classroomService.checkClassroomExist(cid)==1)
        {
            return "fail";
        }
        Classroom classroom=new Classroom();
        classroom.setCid(cid);
        classroom.setCnum(cnum);
        try
        {
           check= classroomService.addClassroom(classroom);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        if (check==1)
        {
            return "success";
        }
        else
            return  "fail";
    }
}
