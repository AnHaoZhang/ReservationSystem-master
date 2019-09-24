package service;


import sun.security.util.Password;

public interface ChangePasswordService
{
    int checkPassword(String password,String id);
    int changePassword(String id,String password,String newPassword);
}
