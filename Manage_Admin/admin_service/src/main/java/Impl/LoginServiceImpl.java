package Impl;

import mapper.AdministratorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Administrator;
import service.LoginService;

@Service
@Transactional
public class LoginServiceImpl implements LoginService
{
    @Autowired
    private AdministratorMapper administratorMapper;
    @Override
    public boolean authentication(Administrator admin)
    {
        /*

         * @Author: shize duan

         * @param : admin 管理员账号密码

         * @return : 验证管理员信息

         * @Description:

         * 管理员登录验证

         */
        Administrator adminCheck = administratorMapper.selectByPrimaryKey(admin.getAid());
        if (adminCheck==null||!(adminCheck.getApwd().equals(admin.getApwd()))||(adminCheck.getArole()!=1))
        {
            return  false;
        }
        admin.setArole(1);
        return  true;
    }
}
