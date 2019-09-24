package pojo;

import java.io.Serializable;

public class Notice implements Serializable{
    private Integer nid;

    private String ntitle;

    private String ncontent;

    private String ntime;

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public String getNtitle() {
        return ntitle;
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle == null ? null : ntitle.trim();
    }

    public String getNcontent() {
        return ncontent;
    }

    public void setNcontent(String ncontent) {
        this.ncontent = ncontent == null ? null : ncontent.trim();
    }

    public String getNtime() {
        return ntime;
    }

    public void setNtime(String ntime) {
        this.ntime = ntime == null ? null : ntime.trim();
    }
}