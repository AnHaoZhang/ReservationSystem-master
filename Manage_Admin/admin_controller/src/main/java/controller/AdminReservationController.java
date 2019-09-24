package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.*;
import service.AdminReservationService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class AdminReservationController
{
    @Value("${CLASSROOM_PAGESIZE}")
    //页面信息条数设置
    private  Integer pageSize;
    @Autowired
    private AdminReservationService adminReservationService;
    @RequestMapping("/admin/adminReservation")
    public  String adminReservation(Model model)
    {
        List<Classroom> classroomList = adminReservationService.getAllClassroom();
        List<Faculty> facultyList = adminReservationService.getAllFaculty();
        model.addAttribute("classroomList",classroomList);
        model.addAttribute("facultyList",facultyList);
        return  "adminReservation";
    }
    @RequestMapping("/admin/adminOrder")
    public  String adminOrder(Ordercr adminOrder,String  startTime,String  endTime,String startDate,String endDate,String weekDay,String aid,Model model)
    {
        List<Classroom> classroomList = adminReservationService.getAllClassroom();
        List<Faculty> facultyList = adminReservationService.getAllFaculty();
        model.addAttribute("classroomList",classroomList);
        model.addAttribute("facultyList",facultyList);
        if(startTime==null||endTime==null|| StringUtils.isEmpty(startTime)||StringUtils.isEmpty(endTime)||startDate==null||endDate==null||StringUtils.isEmpty(startDate)||StringUtils.isEmpty(endDate)||weekDay==null||StringUtils.isEmpty(weekDay))
        {

            model.addAttribute("actionMessage","申请信息填写错误!");
            return "adminReservation";
        }
        if(adminOrder.getAttendcount()==null||adminOrder.getCid()==null||adminOrder.getTheme()==null||adminOrder.getTtelephone()==null||adminOrder.getStelephone()==null||adminOrder.getTeacher()==null||adminOrder.getGroupname()==null||adminOrder.getFaculty()==null)
        {

            model.addAttribute("actionMessage","申请信息填写错误!");
            return "adminReservation";
        }
        if(aid!=null&&StringUtils.isEmpty(aid))
        {

            return "adminReservation";
        }
        adminOrder.setStarttime(startDate);
        adminOrder.setEndtime(endDate);
        adminOrder.setSnum(aid);
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date nowDate=new Date();
        String createTime = dateFormat.format(nowDate);
        adminOrder.setCreatetime(createTime);
        //false 失败 true 成功
        boolean check = adminReservationService.insertOrderAdmin(adminOrder, startTime, endTime, weekDay);
        if (check)
        {
            return  "redirect:getAdminOrderList.html";
        }
        model.addAttribute("actionMessage","申请失败! 此时间段教室已经被占用，请请查看教室预约信息后再次申请!");
        return  "adminReservation";
    }
    @RequestMapping("/admin/getAdminOrderList")
    public  String getAdminOrderList(Integer currentPage, String orderDate,String cid, Model model)
    {
    /*    if(currentPage==null||StringUtils.isEmpty(currentPage))
        {
            return "adminReservationHistory";
        }*/
        AdminOrderPageBean pageBean = adminReservationService.getPageBean(pageSize, currentPage, orderDate, cid);
        model.addAttribute("pageBean",pageBean);
        return  "adminReservationHistory";
    }
    @RequestMapping("/admin/adminOptionStatus")
    public String adminOptionStatus(Integer option,Integer orderid)
    {
    /*    System.out.println("orderId = "+orderid);*/
        if (option!=null&&!StringUtils.isEmpty(option)&&orderid!=null&&!StringUtils.isEmpty(orderid))
        {
            adminReservationService.changeStatus(option,orderid);
        }
        return "redirect:getAdminOrderList.html";
    }
}
