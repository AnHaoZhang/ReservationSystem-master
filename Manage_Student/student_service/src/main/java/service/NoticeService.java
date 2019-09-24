package service;

import pojo.Notice;

import java.util.List;

public interface NoticeService {
    public List<Notice> getNotice();

    public List<Notice> getNotice(Integer page);

    public Integer getNoticeCount();
}
