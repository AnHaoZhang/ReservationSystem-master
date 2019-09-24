package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.ActivityPageBean;
import service.ActivityService;

@Controller
public class ActivityInformationController
{
    @Autowired
    private ActivityService activityService;
    @RequestMapping("/admin/activity")
    public  String  getActivityInformation(String nowDate, Integer currentPage,  Model model)
    {

        ActivityPageBean pageBean =  activityService.getActivityPageBean(15, currentPage, nowDate);
        model.addAttribute("pageBean",pageBean);
        return "activity";
    }
}
