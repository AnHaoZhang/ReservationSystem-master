package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ChangePasswordService;


@Controller
public class ChangPasswordController
{
    @Autowired
    private ChangePasswordService changePasswordService;
    @RequestMapping("/admin/changePassword")
    public  String getChangePassword()
    {
        return  "changePassword";
    }
    @RequestMapping("/admin/changePasswordById")
    @ResponseBody
    public String changePasswordById(String aid, String password, String newPassword)
    {
        /*
        
         * @Author: shize duan
        
         * @param : id 管理员id password 管理员密码  newPassword 新密码
           
         * @return : 返回到修改密码姐界面
            
         * @Description:
        
         * 管理员修改密码
        
         */
        int check=0;
        if((StringUtils.isEmpty(password)||StringUtils.isEmpty(newPassword))||newPassword.length()<8||password.length()<8)
        {
            if (check==0)
            return "fail";
        }
        check = changePasswordService.changePassword(aid, password, newPassword);
        if (check==1)
        return  "success";
        else
            return "fail";
    }

}
