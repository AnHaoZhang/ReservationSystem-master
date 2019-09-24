package Impl;

import mapper.AdministratorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Administrator;
import pojo.AdministratorExample;
import service.ChangePasswordService;

import java.util.List;


@Service
@Transactional
public class ChangePasswordImpl implements ChangePasswordService
{
    @Autowired
    private AdministratorMapper administratorMapper;
    @Override
    public int checkPassword(String id,String password)
    {
        /*

         * @Author: shize duan

         * @param : id 管理员id password 管理员密码

         * @return : 1为账号密码验证正确

         * @Description:

         * 修改管理员密码之前首先验证输入的账号以及原密码是否正确

         */
        AdministratorExample administratorExample=new AdministratorExample();
        AdministratorExample.Criteria criteria = administratorExample.createCriteria();
        criteria.andApwdEqualTo(password);
        criteria.andAidEqualTo(id);
        List<Administrator> administrators = administratorMapper.selectByExample(administratorExample);
        if(administrators!=null&&administrators.size()!=0)
        {
            return 1;
        }
        else
            return 0;

    }

    @Override
    public int changePassword(String id,String password,String newPassword)
    {
        /*

         * @Author: shize duan

         * @param : id 管理员账号 password 管理员原密码 newPassword 管理员新密码

         * @return : 1 代表修改成功 0表示出错

         * @Description:

         * 修改管理员密码

         */
        Administrator administrator=new Administrator();
        int check = checkPassword(id, password);
        administrator.setAid(id);
        administrator.setApwd(newPassword);
        administrator.setArole(1);
        int updateCheck=0;
        if(check==1)
        {
            updateCheck= administratorMapper.updateByPrimaryKey(administrator);
            return  updateCheck;
        }
        else
            return  0;

    }


}
