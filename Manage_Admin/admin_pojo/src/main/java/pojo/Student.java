package pojo;

import java.io.Serializable;

public class Student implements Serializable
{
    private String snum;

    private String sname;

    private String sid;

    private String sfaculty;

    private String smajor;

    private String sclass;

    private String stelphone;

    private String spwd;

    private Integer sstatus;

    private Integer srole;

    private String scard;

    public String getSnum() {
        return snum;
    }

    public void setSnum(String snum) {
        this.snum = snum == null ? null : snum.trim();
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    public String getSfaculty() {
        return sfaculty;
    }

    public void setSfaculty(String sfaculty) {
        this.sfaculty = sfaculty == null ? null : sfaculty.trim();
    }

    public String getSmajor() {
        return smajor;
    }

    public void setSmajor(String smajor) {
        this.smajor = smajor == null ? null : smajor.trim();
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass == null ? null : sclass.trim();
    }

    public String getStelphone() {
        return stelphone;
    }

    public void setStelphone(String stelphone) {
        this.stelphone = stelphone == null ? null : stelphone.trim();
    }

    public String getSpwd() {
        return spwd;
    }

    public void setSpwd(String spwd) {
        this.spwd = spwd == null ? null : spwd.trim();
    }

    public Integer getSstatus() {
        return sstatus;
    }

    public void setSstatus(Integer sstatus) {
        this.sstatus = sstatus;
    }

    public Integer getSrole() {
        return srole;
    }

    public void setSrole(Integer srole) {
        this.srole = srole;
    }

    public String getScard() {
        return scard;
    }

    public void setScard(String scard) {
        this.scard = scard == null ? null : scard.trim();
    }
}