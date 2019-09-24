package controller;

//mvn install -Dmaven.test.skip=true

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Student;
import service.StudentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Transactional
public class UserController {
    @Autowired
    private StudentService studentService;

    /**
     * @param :
     * @return :login.html
     * @Author: Zhancheng Liang
     * @Description:登录界面
     */
    @RequestMapping("student/login")
    public String login() throws Exception {
        return "login";
    }

    public static boolean isNumeric(String str) {
        for (int i = str.length(); --i >= 0; ) {
            int chr = str.charAt(i);
            if (chr < 48 || chr > 57)
                return false;
        }
        return true;
    }

    /**
     * @param : username 用户名， pwd密码
     * @return :  login.html/personalOrder.html
     * @Author: Zhancheng Liang
     * @Description: 登录验证
     */
    @RequestMapping("student/loginValidate")
    public String validateLogin(Model model, String username, String pwd, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("studentSession");
        if (username == null || pwd == null) {
            if (student == null) {
                return "redirect:login.html";
            } else {
                return "redirect:activeAccount.html";
            }
        }
        if (studentService.validateStudent(username.trim(), pwd.trim()) && !username.equals("admin")) {
            session = request.getSession();
            student = studentService.getStudentInfo(username.trim());
            session.setAttribute("studentSession", student);
            return "redirect:activeAccount.html";
        }
        if (studentService.existStudent(username) != 0 && studentService.getStudentInfo(username.trim()).getSstatus() == 0) {
            model.addAttribute("errorMessage", "该账号尚未激活，请登录以激活账号！（初始密码为学号）");
            model.addAttribute("studentSession", null);
        } else if (studentService.existStudent(username) == 0) {
            model.addAttribute("errorMessage", "该账号不存在");
        } else {
            model.addAttribute("errorMessage", "用户名或密码错误");
        }
        model.addAttribute("username", username);
        model.addAttribute("pwd", pwd);

        return "login";
    }

    /*

     * @Author: Zhancheng Liang

     * @param :

     * @return :

     * @Description: 找回密码页面

     *

     */
    @RequestMapping("student/forgetPassword")
    public String forgetPassword() {
        return "forgetPassword";
    }

    @RequestMapping("student/passwordReset")
    public String passwordReset(Model model, String snum, String sname, String spwd, String spwdConvinced, String sid) {
        if (snum == null || sname == null || spwd == null || spwdConvinced == null || sid == null) {
            return "redirect:login.html";
        }
        Student student = studentService.getStudentInfo(snum);
        if (studentService.existStudent(snum) == 0) {
            model.addAttribute("errorMessage", "所提交的信息有误，请检查后重试！");
            model.addAttribute("snum", snum);
            model.addAttribute("spwd", spwd);
            model.addAttribute("spwdConvinced", spwdConvinced);
            model.addAttribute("sname", sname);
            model.addAttribute("sid", sid);
            return "forgetPassword";
        } else if (!sname.trim().equals(student.getSname()) || !sid.trim().equals(student.getSid()) || spwd == null || sid.trim().length() != 18) {
            model.addAttribute("errorMessage", "所提交的信息有误，请检查后重试！");
            model.addAttribute("snum", snum);
            model.addAttribute("spwd", spwd);
            model.addAttribute("spwdConvinced", spwdConvinced);
            model.addAttribute("sname", sname);
            model.addAttribute("sid", sid);
            return "forgetPassword";
        } else if (!spwd.equals(spwdConvinced)) {
            model.addAttribute("errorMessage", "两次密码内容不一致！");
            model.addAttribute("snum", snum);
            model.addAttribute("spwd", spwd);
            model.addAttribute("spwdConvinced", spwdConvinced);
            model.addAttribute("sname", sname);
            model.addAttribute("sid", sid);
            return "forgetPassword";
        } else if (spwd.length() < 6) {
            model.addAttribute("errorMessage", "密码长度应不少于6位");
            model.addAttribute("snum", snum);
            model.addAttribute("spwd", spwd);
            model.addAttribute("spwdConvinced", spwdConvinced);
            model.addAttribute("sname", sname);
            model.addAttribute("sid", sid);
            return "forgetPassword";
        }
        student.setSpwd(spwd);
        studentService.updatePassword(student);
        model.addAttribute("snum", snum);
        return "login";
    }
}
