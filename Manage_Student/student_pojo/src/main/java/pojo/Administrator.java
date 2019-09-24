package pojo;

import java.io.Serializable;

public class Administrator implements Serializable {

    private String aid;

    private String apwd;

    private Integer arole;

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid == null ? null : aid.trim();
    }

    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd == null ? null : apwd.trim();
    }

    public Integer getArole() {
        return arole;
    }

    public void setArole(Integer arole) {
        this.arole = arole;
    }
}