package pojo;

import java.io.Serializable;

public class Classroom implements Serializable
{
    private String cid;

    private Integer cnum;

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid == null ? null : cid.trim();
    }

    public Integer getCnum() {
        return cnum;
    }

    public void setCnum(Integer cnum) {
        this.cnum = cnum;
    }
}