package pojo;

import java.io.Serializable;

public class Teacher  implements Serializable
{
    private String tnum;

    private String tname;

    private String ttelphone;

    public String getTnum() {
        return tnum;
    }

    public void setTnum(String tnum) {
        this.tnum = tnum == null ? null : tnum.trim();
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public String getTtelphone() {
        return ttelphone;
    }

    public void setTtelphone(String ttelphone) {
        this.ttelphone = ttelphone == null ? null : ttelphone.trim();
    }
}