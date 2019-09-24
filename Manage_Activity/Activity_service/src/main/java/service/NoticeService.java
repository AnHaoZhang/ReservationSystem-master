package service;

import pojo.Notice;

import java.util.List;

public interface NoticeService
{
    void  insertNotice(String noticeText, String noticeTitle);
    List<Notice> getNoticeHistory();

    void deleteHistory(Integer nid);
}
