package service;

import pojo.Student;

public interface StudentService {
    Student getStudentInfo(String snum);

    void updatePassword(Student student);

    boolean stuInfoValidate(String snum, String originalPwd);

    void updateStuInfo(Student student);

    boolean validateStudent(String snum, String spwd);//登录验证

    Integer existStudent(String snum);
}
