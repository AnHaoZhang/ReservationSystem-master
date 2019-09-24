package Impl;

import mapper.ClassroomItemMapper;
import mapper.ClassroomMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Classroom;
import pojo.ClassroomExample;
import pojo.ClassroomStatus;
import service.ClassroomService;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ClassroomServiceImpl implements ClassroomService {

    @Autowired
    ClassroomMapper classroomMapper;
    @Autowired
    ClassroomItemMapper classroomItemMapper;

    @Override
    public List<Classroom> getClassroomList() {
        List<Classroom> list = classroomItemMapper.getClassroomItemList();
        return list;
    }

    @Override
    public Classroom getClassroomByCid(String cid) {
        Classroom classroom = classroomMapper.selectByPrimaryKey(cid);
        return classroom;
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  教室号，日期

     * @return :    classroomList

     * @Description:按照教室号和日期查询教室信息

     *

     */
    @Override
    public List getClassroomList(@Param("cid") String cid, @Param("startdate") String startdate) {
        List classroomList = new ArrayList();

        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        if (cid.equals("all") || startdate.equals("")) {
            //查所有教室
            startdate = df.format(date);
            classroomList = classroomItemMapper.getClassroomListSingleDay("", startdate);
        } else if (cid != "all") {
            //查单独的教室
            if (startdate.equals("")) {
                //日期栏里没有信息，自动补为当天日期
                startdate = df.format(date);
            }
            classroomList = classroomItemMapper.getClassroomListSingleDay(cid, startdate);
        }
        return classroomList;
    }

    @Override
    public Integer getClassroomCount(String cid) {
        ClassroomExample example = new ClassroomExample();
        example.createCriteria().andCidEqualTo(cid);
        return classroomMapper.countByExample(example);
    }
}
