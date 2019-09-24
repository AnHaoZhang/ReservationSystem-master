package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Administrator;
import service.LoginService;

import javax.servlet.http.HttpSession;
import java.util.regex.Pattern;

@Controller
public class LoginController
{
    @Autowired
    private LoginService loginService;

    @RequestMapping("/index")
    public  String getIndexHtml()
    {
        return  "login";
    }
    @RequestMapping("/admin/login")
    public String adminLogin(Administrator admin, HttpSession session)
    {

        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        if (admin == null || admin.getAid() == null || admin.getApwd() == null || StringUtils.isEmpty(admin.getAid()) || StringUtils.isEmpty(admin.getApwd()))
        {
            return "login";
        }
        if (!pattern.matcher(admin.getAid()).matches()||admin.getApwd().length()<8)
        {
            return  "login";
        }
        if (!loginService.authentication(admin))
        {
            return "login";
        }
        else
        {
            session.setAttribute("admin",admin);
        }
        return "redirect:activity.html";
    }
    @RequestMapping("/admin/existAdmin")
    public  String existAdmin(HttpSession session)
    {
        session.setAttribute("admin",null);
        return "redirect:login.html";
    }
}
