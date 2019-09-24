package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.ActivityPageBean;
import service.ActivityService;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class ActivityInformationController
{
    @Autowired
    private ActivityService activityService;
    @RequestMapping("/admin/activity")
    public  String  getActivityInformation(Integer currentPage,  Model model)
    {
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String  nowDate=dateFormat.format(new Date());
        ActivityPageBean pageBean =  activityService.getActivityPageBean(10, currentPage, nowDate);
        model.addAttribute("pageBean",pageBean);
        return "activity";
    }
    @RequestMapping("/admin/information")
    public  String getInformation()
    {
        return "information";
    }
}
