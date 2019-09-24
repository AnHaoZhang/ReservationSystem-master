package Impl;

import mapper.StudentItemMapper;
import mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Student;
import pojo.StudentExample;
import service.StudentService;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private StudentItemMapper studentItemMapper;

    @Override
    public Student getStudentInfo(String snum) {
        Student student = studentMapper.selectByPrimaryKey(snum);
        return student;
    }

    @Override
    public void updatePassword(Student student) {
        studentItemMapper.updateSpwdBySnum(student);
    }

    @Override
    public boolean stuInfoValidate(String snum, String originalPwd) {
        Student stuOld = studentMapper.selectByPrimaryKey(snum);
        if (stuOld != null) {
            if (snum.equals(stuOld.getSnum()) && originalPwd.equals(stuOld.getSpwd())) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void updateStuInfo(Student student) {
        studentItemMapper.updateStuInfo(student);
    }

    @Override
    public boolean validateStudent(String snum, String spwd) {
        StudentExample example = new StudentExample();
        example.createCriteria().andSnumEqualTo(snum).andSpwdEqualTo(spwd);
        if (studentMapper.countByExample(example) != 0) {
            return true;
        }
        return false;
    }

    @Override
    public Integer existStudent(String snum) {
        StudentExample example = new StudentExample();
        example.createCriteria().andSnumEqualTo(snum);
        return studentMapper.countByExample(example);
    }
}
