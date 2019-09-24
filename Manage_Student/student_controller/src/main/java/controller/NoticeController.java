package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Notice;
import pojo.Student;
import service.NoticeService;
import service.StudentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@Transactional
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("/student/notice")
    public String getNotice(HttpServletRequest request, Model model, @RequestParam(value = "page", defaultValue = "1") Integer page) {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("studentSession");
        if (session == null || student == null) {
            return "login";
        }
        session.setAttribute("studentSession", student);
        model.addAttribute("student", student);

        Integer noticeCount = noticeService.getNoticeCount();

        Integer finalPage = noticeCount / 8;

        if (page <= 1) {
            page = 1;
        }
        if (page > noticeCount / 8 && noticeCount >= 8) {
            page = noticeCount / 8;
        }
        List<Notice> noticeList = new ArrayList<>();
        if (noticeCount > 0) {
            noticeList = noticeService.getNotice(page);
        }
        if(noticeCount < 8){
            finalPage = 1;
        }

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("student", student);
        model.addAttribute("snum", student.getSnum());
        model.addAttribute("noticeCount", noticeCount);
        model.addAttribute("prePage", page - 1);
        model.addAttribute("thisPage", page);
        model.addAttribute("nextPage", page + 1);
        model.addAttribute("finalPage", finalPage);
        return "notice";
    }
}
