package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.OrderItem;
import pojo.OrderTimeTable;
import pojo.PageBean;
import service.OrderService;
import service.ReservationService;

import java.util.List;

@Controller
public class ReservationClassroomController
{
    @Value("${CLASSROOM_PAGESIZE}")
    private  Integer pageSize;
    @Autowired
    private ReservationService reservationService;
    @RequestMapping("/admin/reservationClassroom")

    public  String getReservationClassroom(Model model,String cid,String orderDate,Integer currentPage)
    {
        /*

         * @Author: shize duan

         * @param : cid 教室编号 orderDate 预约日期 currentPage 当前页码

         * @return : 返回  reservationClassroom.jsp

         * @Description:

         * 获取页面需要的数据封装到pageBean里面

         */
        PageBean pageBean = reservationService.getOrderTimeTableList(pageSize, currentPage, cid, orderDate);
        model.addAttribute("pageBean",pageBean);
        return "reservationClassroom";
    }
}
