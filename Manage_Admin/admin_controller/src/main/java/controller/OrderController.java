package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pojo.OrderItem;

import service.OrderService;

import java.util.List;

@Controller
public class OrderController
{
    @Autowired
    private OrderService orderListService;
    @RequestMapping("/admin/orderTable")
    public String getOrderTable(Model model)
    {
        /*

         * @Author: shize duan

         * @param :

         * @return : 返回orderTable页面

         * @Description:

         * 获取预定信息

         */
        List<OrderItem> orderList = orderListService.getOrderList();
        model.addAttribute("orderList", orderList);
        return "orderTable";
    }
    @RequestMapping("/admin/optionStatus")
    public  String changeStatus(Integer oid,Integer option)
    {
        /*

         * @Author: shize duan

         * @param :

         * @return : 跳转到orderTale页面

         * @Description:

         *

         */
        if(oid==null||option==null)
        {
            return "redirect:admin/orderTable.html";
        }
        orderListService.changeOption(oid, option);
        return "redirect:orderTable.html";
    }
}
