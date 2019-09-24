package pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ClassroomStatus implements Serializable {
    private String cid;
    private String date;
    private List<String> timeList;
    private List<Integer> status;

    public ClassroomStatus() {
        List<String> timeList = new ArrayList<>();
        List<Integer> status = new ArrayList<>();
        timeList.add("08:00".trim());
        timeList.add("09:00".trim());
        for (int i = 10; i <= 21; i++) {
            timeList.add((i + ":00").trim());
        }
        this.timeList = timeList;
        this.status = status;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<String> getTimeList() {
        return timeList;
    }

    public void setTimeList(List<String> timeList) {
        this.timeList = timeList;
    }

    public List<Integer> getStatus() {
        return status;
    }

    public void setStatus(List<Integer> status) {
        this.status = status;
    }
}
