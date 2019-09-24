package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.PageBean;
import service.StudentService;


@Controller
public class StudentInformationController
{
    @Autowired
    private StudentService studentService;
    @RequestMapping("/admin/studentInformation")
    public String getStudentInformation(Model model,String sid,Integer currentPage)
    {
        PageBean pageBean = studentService.getStudentPageBean(sid, 15, currentPage);
        model.addAttribute("pageBean",pageBean);
        return  "studentInformation";
    }
}
