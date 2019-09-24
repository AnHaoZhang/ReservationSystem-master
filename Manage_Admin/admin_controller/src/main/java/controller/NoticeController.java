package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Notice;
import service.NoticeService;

import java.util.List;

@Controller
public class NoticeController
{
    @Autowired
    private NoticeService noticeService;
    @RequestMapping("/admin/noticeSend")
    public  String getNotice()
    {
        return "noticeSend";
    }
    @RequestMapping("/admin/noticeSendToStudent")
    @ResponseBody
    public  String sendNotice(String noticeText,String noticeTitle)
    {
        noticeService.insertNotice(noticeText,noticeTitle);
        return  "success";
    }
    @RequestMapping("/admin/noticeHistory")
    public  String getNoticeHistory(Model model)
    {
        List<Notice> noticeList = noticeService.getNoticeHistory();
        model.addAttribute("noticeList",noticeList);
        return  "noticeHistory";
    }
    @RequestMapping("/admin/noticeDelete")
    public  String deleteHistory(Integer nid)
    {
        noticeService.deleteHistory(nid);
        return  "noticeHistory";
    }
}
