package pojo;

import java.io.Serializable;

public class Ordercr implements Serializable {
    private Integer orderid;

    private String cid;

    private String starttime;

    private String endtime;

    private String theme;

    private String snum;

    private String stelephone;

    private String faculty;

    private String groupname;

    private String teacher;

    private String ttelephone;

    private Integer attendcount;

    private Integer orderstatus;

    private String createtime;

    private String details;

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    private Student student;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid == null ? null : cid.trim();
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime == null ? null : starttime.trim();
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime == null ? null : endtime.trim();
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme == null ? null : theme.trim();
    }

    public String getSnum() {
        return snum;
    }

    public void setSnum(String snum) {
        this.snum = snum == null ? null : snum.trim();
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty == null ? null : faculty.trim();
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname == null ? null : groupname.trim();
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher == null ? null : teacher.trim();
    }

    public String getStelephone() {
        return stelephone;
    }

    public void setStelephone(String stelephone) {
        this.stelephone = stelephone == null ? null : stelephone.trim();
    }

    public Integer getAttendcount() {
        return attendcount;
    }

    public void setAttendcount(Integer attendcount) {
        this.attendcount = attendcount;
    }

    public Integer getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(Integer orderstatus) {
        this.orderstatus = orderstatus;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getTtelephone() {
        return ttelephone;
    }

    public void setTtelephone(String ttelephone) {
        this.ttelephone = ttelephone;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}