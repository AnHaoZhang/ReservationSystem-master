package Impl;

import mapper.NoticeItemMapper;
import mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Notice;
import service.NoticeService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService
 {
     @Autowired
     private NoticeMapper noticeMapper;
     @Autowired
     private NoticeItemMapper noticeItemMapper;
     @Override
     public void insertNotice(String noticeText, String noticeTitle)
     {
         Notice notice=new Notice();
         Date date=new Date();
         SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
         String dateString = dateFormat.format(date);
         notice.setNtime(dateString);
         notice.setNtitle(noticeTitle);
         notice.setNcontent(noticeText);
         noticeMapper.insert(notice);
     }

     @Override
     public List<Notice> getNoticeHistory()
     {
         List<Notice> noticeList = noticeItemMapper.selectAllNotice();
         return  noticeList;
     }


     @Override
     public void deleteHistory(Integer nid)
     {
         noticeMapper.deleteByPrimaryKey(nid);
     }

 }
