package controller;

import controller.wordexport.WordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import pojo.Classroom;
import pojo.ClassroomStatus;
import pojo.Ordercr;
import pojo.Student;
import service.ClassroomService;
import service.NoticeService;
import service.OrderService;
import service.StudentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@Transactional
public class OrdercrController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private ClassroomService classroomService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    /*

     * @Author: Zhancheng Liang

     * @param : 学号

     * @return :    个人订单页面

     * @Description:    查询个人全部订单

     *

     */
    @RequestMapping("/student/personalOrder")
    public String getOrderTableBySnum(HttpServletRequest request, Model model, @RequestParam(defaultValue = "1") Integer page) throws ParseException {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("studentSession");
        if (session == null || student == null) {
            return "login";
        }
        session.setAttribute("studentSession", student);
        model.addAttribute("student", student);

        List<Classroom> classroomList = classroomService.getClassroomList();
        Integer orderCount = orderService.orderCount(student.getSnum(), "all", "");
        if (page <= 1) {
            page = 1;
        }
        if (page > orderCount / 8 && orderCount >= 8) {
            page = orderCount / 8;
        }
        List<Ordercr> orderList = new ArrayList<>();
        if (orderCount > 0) {
            orderList = orderService.getOrderList(student.getSnum(), page);
            for (Ordercr ordercr : orderList) {
                orderService.alreadyUsed(ordercr.getOrderid());
            }
        }

        if (orderService.hasOrderedToday(student.getSnum())) {
            orderService.otherOrderCancel(student.getSnum());
            orderService.updateApplication(orderService.getOrderList(student.getSnum()), student.getSnum());
        } else {
            orderService.updateApplication(orderList, student.getSnum());
        }

        model.addAttribute("orderCount", orderCount);
        model.addAttribute("orderList", orderList);
        model.addAttribute("snum", student.getSnum());
        model.addAttribute("classroomList", classroomList);
        model.addAttribute("prePage", page - 1);
        model.addAttribute("thisPage", page);
        model.addAttribute("nextPage", page + 1);
        model.addAttribute("finalPage", orderCount / 8);
        model.addAttribute("cid", "all");
        model.addAttribute("student", student);

        return "personalOrder";
    }

    /*

     * @Author: Zhancheng Liang

     * @param :  snum学号

     * @return :    application.html申请界面

     * @Description: 获得学院表，返回到申请界面

     *

     */
    @RequestMapping("/student/application")
    public String getApplicationInfo(HttpServletRequest request, Model model, String snum, String cid, String startdate, String starttime, String endtime) throws ParseException {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("studentSession");
        if (session == null || student == null) {
            return "login";
        }
        session.setAttribute("studentSession", student);
        model.addAttribute("student", student);


        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String start1 = "";
            Date start2 = new Date();
            if (startdate == null || starttime == null) {
                start1 = dateFormat.format(new Date());
            } else {
                start1 = startdate + " " + starttime + ":00";
                start2 = dateFormat.parse(start1);
            }

            Date now1 = new Date();
            if (startdate != null && now1.compareTo(start2) >= 0) {
                List<Classroom> classroomList = classroomService.getClassroomList();
                Integer orderCount = orderService.orderCount(student.getSnum(), "all", "");
                Integer page = 1;
                if (page > orderCount / 8 && orderCount >= 8) {
                    page = orderCount / 8;
                }
                List<Ordercr> orderList = new ArrayList<>();
                if (orderCount > 0) {
                    orderList = orderService.getOrderList(student.getSnum(), page);
                    for (Ordercr ordercr : orderList) {
                        orderService.alreadyUsed(ordercr.getOrderid());
                    }
                }

                if (orderService.hasOrderedToday(student.getSnum())) {
                    orderService.otherOrderCancel(student.getSnum());
                } else {
                    orderService.updateApplication(orderList, student.getSnum());
                }

                model.addAttribute("message", "<script>alert('请选择当前时间之后的教室');</script>");

                model.addAttribute("orderCount", orderCount);
                model.addAttribute("orderList", orderList);
                model.addAttribute("snum", student.getSnum());
                model.addAttribute("classroomList", classroomList);
                model.addAttribute("prePage", page - 1);
                model.addAttribute("thisPage", page);
                model.addAttribute("nextPage", page + 1);
                model.addAttribute("finalPage", orderCount / 8);
                model.addAttribute("cid", "all");
                model.addAttribute("student", student);

                return "personalOrder";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (startdate == null) {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            startdate = dateFormat.format(new Date());
        }
        if (startdate != null && orderService.hasOrderedTheDay(student.getSnum(), startdate) != 0) {
            List<Classroom> classroomList = classroomService.getClassroomList();
            Integer orderCount = orderService.orderCount(student.getSnum(), "all", "");
            Integer page = 1;
            if (page > orderCount / 8 && orderCount >= 8) {
                page = orderCount / 8;
            }
            List<Ordercr> orderList = new ArrayList<>();
            if (orderCount > 0) {
                orderList = orderService.getOrderList(student.getSnum(), page);
                for (Ordercr ordercr : orderList) {
                    orderService.alreadyUsed(ordercr.getOrderid());
                }
            }

            if (orderService.hasOrderedToday(student.getSnum())) {
                orderService.otherOrderCancel(student.getSnum());
            } else {
                orderService.updateApplication(orderList, student.getSnum());
            }

            model.addAttribute("message", "<script>alert('已成功预订过该天的教室或正在申请中，现在不能申请');</script>");

            model.addAttribute("orderCount", orderCount);
            model.addAttribute("orderList", orderList);
            model.addAttribute("snum", student.getSnum());
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("prePage", page - 1);
            model.addAttribute("thisPage", page);
            model.addAttribute("nextPage", page + 1);
            model.addAttribute("finalPage", orderCount / 8);
            model.addAttribute("cid", "all");
            model.addAttribute("student", student);

            return "personalOrder";
        }

        if (startdate != null && starttime != null) {
            String chooseTime = startdate + " " + starttime + ":00";
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                Date start = df.parse(chooseTime);
                Date now = new Date();
                if (now.compareTo(start) >= 0) {

                    ClassroomStatus classroomStatus1 = new ClassroomStatus();

                    Date date = new Date();
                    List<Classroom> classroomList = classroomService.getClassroomList();//教室列表
                    List classList = classroomService.getClassroomList("all", df.format(date));//教室使用列表
                    model.addAttribute("classroomList", classroomList);
                    model.addAttribute("classList", classroomList);
                    model.addAttribute("startdate", startdate);

                    startdate = df.format(date);

                    List<ClassroomStatus> classroomStatusList = new ArrayList<>();
                    List<Integer> statusList = new ArrayList<>();
                    List<Integer[]> statusLists = new ArrayList<>();//statusList的集合
                    //查询一系列教室的某天
                    for (int i = 0; i < classroomList.size(); i++) {
                        //查询一个教室的某天
                        ClassroomStatus classroomStatus = new ClassroomStatus();
                        classroomStatusList.add(classroomStatus);
                        classroomStatusList.get(i).setCid(classroomList.get(i).getCid());
                        classroomStatusList.get(i).setDate(startdate);

                        for (int j = 8; j < 21; j++) {
                            int status = -1;
                            statusList.add(status);
                            if (orderService.isOrdered(classroomList.get(i).getCid(), startdate + " " + j + ":00:00", startdate + " " + (j + 1) + ":00:00")) {
                                statusList.set(j - 8, 1);
                            } else {
                                statusList.set(j - 8, -1);
                            }
                        }
                        classroomStatusList.get(i).setStatus(statusList);

                        Integer[] integers = new Integer[statusList.size()];
                        statusList.toArray(integers);

                        statusLists.add(integers);
                        statusList.clear();
                    }
                    model.addAttribute("classroomStatusList", classroomStatusList);//班级+状态列表
                    model.addAttribute("statusLists", statusLists);//状态列表
                    model.addAttribute("classroomStatus1", classroomStatus1);
                    model.addAttribute("cid", "all");
                    model.addAttribute("message", "<script>alert('请选择当前时刻之后的时间段！');</script>");
                    return "ClassroomInfo";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        String endtime1 = null;
        if (orderService.hasOrderedToday(student.getSnum())) {
            orderService.otherOrderCancel(student.getSnum());
            List<Classroom> classroomList = classroomService.getClassroomList();
            Integer orderCount = orderService.orderCount(student.getSnum(), "all", "");
            Integer page = 1;
            Integer finalPage = orderCount / 8;

            if (page > orderCount / 8 && orderCount >= 8) {
                page = orderCount / 8;
            }
            List<Ordercr> orderList = new ArrayList<>();
            if (orderCount > 0) {
                orderList = orderService.getOrderList(student.getSnum(), page);
                for (Ordercr ordercr : orderList) {
                    orderService.alreadyUsed(ordercr.getOrderid());
                }
            }
            if (orderService.hasOrderedToday(student.getSnum())) {
                orderService.otherOrderCancel(student.getSnum());
            } else {
                orderService.updateApplication(orderList, student.getSnum());
            }
            model.addAttribute("orderCount", orderCount);
            model.addAttribute("orderList", orderList);
            model.addAttribute("classroomList", classroomList);

            orderService.updateApplication(orderList, student.getSnum());
            model.addAttribute("message", "<script>alert('今天已成功预订过一次教室或正在申请中，现在不能申请');</script>");

            model.addAttribute("student", student);
            model.addAttribute("snum", student.getSnum());
            model.addAttribute("prePage", 0);
            model.addAttribute("thisPage", 1);
            model.addAttribute("nextPage", 2);
            model.addAttribute("finalPage", finalPage);
            model.addAttribute("cid", "all");

            return "personalOrder";
        } else {
            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();
            model.addAttribute("cid", cid);
            model.addAttribute("startdate", startdate);
            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            if (starttime == null || starttime.equals("08:00")) {
                model.addAttribute("starttime", "08:00");
                endtime = "09:00";
                endtime1 = "10:00";
            } else {
                model.addAttribute("starttime", starttime);
                endtime = "" + (Integer.parseInt(starttime.trim().substring(0, 2)) + 1) + ":00";
                endtime1 = "" + (Integer.parseInt(starttime.trim().substring(0, 2)) + 2) + ":00";
            }
            model.addAttribute("endtime", endtime);
            model.addAttribute("endtime1", endtime1);
        }

        return "application";
    }


    /**
     * 利用正则表达式判断字符串是否是数字
     *
     * @param str
     * @return
     */
    public boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }

    /**
     * 判断是否为整数
     *
     * @param str 传入的字符串
     * @return 是整数返回true, 否则返回false
     */
    public static boolean isInteger(String str) {
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        return pattern.matcher(str).matches();
    }

    /*

     * @Author: Zhancheng Liang

     * @param : 订单信息ordercr

     * @return :  用户订单界面

     * @Description:    用户提交订单成功后返回自己的已预订界面

     *

     */
    @RequestMapping("/student/applicationClassroom")
    public String handleApplication(HttpServletRequest request, @ModelAttribute Ordercr ordercr, @RequestParam("startdate") String startdate, @RequestParam("sname") String sname, String snum, Model model) {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("studentSession");
        if (session == null || student == null) {
            return "login";
        }
        session.setAttribute("studentSession", student);
        model.addAttribute("student", student);

        if (orderService.hasOrderedTheDay(student.getSnum(), startdate) != 0) {
            model.addAttribute("errorMessage", "您已有订单在该天处于申请或同意状态，不能预约该天！");
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("cid", ordercr.getCid());
            model.addAttribute("ttelphone", ordercr.getTtelephone());
            model.addAttribute("startdate", startdate);
            return "application";
        }

        if (!student.getSnum().equals(ordercr.getSnum())) {
            model.addAttribute("errorMessage", "登录账号与提交学号不一致，请重试！");
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("cid", ordercr.getCid());
            model.addAttribute("ttelphone", ordercr.getTtelephone());
            return "application";
        }

        String errorMessage = null;
        Integer classAllowCount = classroomService.getClassroomByCid(ordercr.getCid()).getCnum();
        Integer peopleCount = classAllowCount - ordercr.getAttendcount();   //教室容量与参加人数之差

        model.addAttribute("starttime", ordercr.getStarttime());
        model.addAttribute("endtime", ordercr.getEndtime());
        model.addAttribute("startdate", startdate);
        model.addAttribute("faculty", ordercr.getFaculty());
        model.addAttribute("ttelphone", ordercr.getTtelephone());

        String starttime = startdate + " " + ordercr.getStarttime() + ":00";
        String endtime = startdate + " " + ordercr.getEndtime() + ":00";

        if (peopleCount < 0) {
            errorMessage = "参加人数大于教室容量，请修改！";
            model.addAttribute("errorMessage", errorMessage);
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("cid", ordercr.getCid());

            return "application";

        }

        if (ordercr.getDetails().length() < 50 || ordercr.getDetails().length() > 150) {
            errorMessage = "活动详情字数应在50到150字之间";
            model.addAttribute("errorMessage", errorMessage);
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("cid", ordercr.getCid());

            return "application";
        }

        if (ordercr.getAttendcount() > 50) {
            errorMessage = "参加人数应不超过50人，请修改！";
            model.addAttribute("errorMessage", errorMessage);
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("cid", ordercr.getCid());

            return "application";

        }

        if (ordercr.getTheme().length() <= 5) {
            errorMessage = "主题不能少于6个字符，请修改！";
            model.addAttribute("errorMessage", errorMessage);
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("cid", ordercr.getCid());

            return "application";

        }

        if (ordercr.getCid() == "" || ordercr.getStarttime() == "" || ordercr.getEndtime() == "" || ordercr.getTheme() == "" || ordercr.getSnum() == "" || ordercr.getFaculty() == "" || ordercr.getGroupname() == "" || ordercr.getTeacher() == "" || ordercr.getStelephone() == "" || ordercr.getAttendcount().toString() == "" || sname == "" || startdate == "" || !(isNumeric(ordercr.getTtelephone()) && ordercr.getTtelephone().length() == 11 && isNumeric(ordercr.getStelephone()) && ordercr.getStelephone().length() == 11 && isNumeric(ordercr.getAttendcount().toString()) && isInteger(ordercr.getAttendcount().toString())) || ordercr.getAttendcount() <= 0) {
            errorMessage = "请检查信息是否填写完整！";
            model.addAttribute("errorMessage", errorMessage);
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("cid", ordercr.getCid());

            return "application";

        } else if (orderService.isBeforeTime(new Date(), starttime, endtime)) {
            //判断选择的开始/结束时间是否为现在时刻之后的时间
            errorMessage = "请选择当前时刻之后的时间段";
            model.addAttribute("errorMessage", errorMessage);
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("cid", ordercr.getCid());

            return "application";

        } else if (orderService.isOrdered(ordercr.getCid(), starttime, endtime)) {
            //判断该教室的时间段是否已经被预订
            errorMessage = "该教室的时间段已经被预订，请重新选择！";

            model.addAttribute("errorMessage", errorMessage);
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);

            return "application";

        } else if (orderService.hasOrderedToday(student.getSnum())) {
            errorMessage = "您今天已经成功预订过一次教室，已不能申请，请明天再重试！";

            model.addAttribute("errorMessage", errorMessage);
            model.addAttribute("ordercr", ordercr);
            model.addAttribute("errorFlag", 1);

            List<String> facultyList = orderService.getFacultyList();
            List<Classroom> classroomList = classroomService.getClassroomList();

            model.addAttribute("facultyList", facultyList);
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("cid", "all");

            return "application";

        } else if (ordercr.getTheme().length() > 5 && isNumeric(ordercr.getStelephone()) && ordercr.getStelephone().length() == 11 && isNumeric(ordercr.getAttendcount().toString()) && isInteger(ordercr.getAttendcount().toString()) && isNumeric(ordercr.getTtelephone()) && ordercr.getTtelephone().length() == 11) {
            //判断手机号是否为纯数字和长度是否为11 且 参加人数是否为整数，若都满足，则进行插入，否则，退回到申请界面
            ordercr.setStarttime(starttime);
            ordercr.setEndtime(endtime);
            Date date = new Date();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            ordercr.setOrderstatus(0); // 订单状态默认是0-申请中
            ordercr.setCreatetime(df.format(date));
            orderService.addOrder(ordercr);
            Integer orderCount = orderService.orderCount(student.getSnum(), "all", "");

            Integer page = 1;

            List<Classroom> classroomList = classroomService.getClassroomList();

            if (page <= 1) {
                page = 1;
            }
            if (page > orderCount / 8 && orderCount >= 8) {
                page = orderCount / 8;
            }
            List<Ordercr> orderList = new ArrayList<>();
            if (orderCount > 0) {
                orderList = orderService.getOrderList(student.getSnum(), page);
                for (Ordercr ordercr1 : orderList) {
                    orderService.alreadyUsed(ordercr1.getOrderid());
                }
            }
            if (orderService.hasOrderedToday(student.getSnum())) {
                orderService.otherOrderCancel(student.getSnum());
            } else {
                orderService.updateApplication(orderList, student.getSnum());
            }

            model.addAttribute("orderCount", orderCount);
            model.addAttribute("orderList", orderList);
            model.addAttribute("snum", student.getSnum());
            model.addAttribute("classroomList", classroomList);
            model.addAttribute("prePage", page - 1);
            model.addAttribute("thisPage", page);
            model.addAttribute("nextPage", page + 1);
            model.addAttribute("finalPage", orderCount / 8);
            model.addAttribute("cid", "all");
            model.addAttribute("student", student);
            model.addAttribute("startdate", "");

            return "redirect:personalOrder.html";

        }
        return "application";
    }

    /*

     * @Author: Zhancheng Liang

     * @param :     orderid订单号

     * @return :    用户订单界面

     * @Description:    撤销申请

     *

     */
    @RequestMapping("/student/withdrawApplication")
    public String withdrawApplication(HttpServletRequest request, @RequestParam("orderid") Integer orderid, Model model) {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("studentSession");
        if (session == null || student == null) {
            return "login";
        }
        session.setAttribute("studentSession", student);
        model.addAttribute("student", student);
        boolean flag = orderService.withdrawApplication(orderid);
        if (flag) {

        } else {
            model.addAttribute("errorMessage", "撤销失败，该申请已被同意");
            model.addAttribute("errorFlag", 1);
        }
        Integer orderCount = orderService.orderCount(student.getSnum(), "all", "");

        model.addAttribute("orderCount", orderCount);
        return "redirect:personalOrder.html";
    }

    @RequestMapping("/student/queryOrder")
    public String queryPersonalOrder(HttpServletRequest request, Model model, @RequestParam("cid") String cid, @RequestParam(value = "startdate") String startdate, @RequestParam(defaultValue = "1") Integer page) {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("studentSession");
        if (session == null || student == null) {
            return "login";
        }
        session.setAttribute("studentSession", student);
        model.addAttribute("student", student);
        List<Ordercr> list = orderService.getOrderList(student.getSnum(), cid, startdate, page);

        List<Classroom> classroomList = classroomService.getClassroomList();
        Integer orderCount = orderService.orderCount(student.getSnum(), cid, startdate);

        if (page <= 1) {
            page = 1;
        }
        if (page > orderCount / 8 && orderCount >= 8) {
            page = orderCount / 8;
        }
        List<Ordercr> orderList = new ArrayList<>();
        if (orderCount > 0) {
            orderList = orderService.getOrderList(student.getSnum(), page);
            for (Ordercr ordercr : orderList) {
                orderService.alreadyUsed(ordercr.getOrderid());
            }
        }
        if (orderService.hasOrderedToday(student.getSnum())) {
            orderService.otherOrderCancel(student.getSnum());
        } else {
            orderService.updateApplication(orderList, student.getSnum());
        }

        model.addAttribute("student", student);
        model.addAttribute("prePage", page - 1);
        model.addAttribute("thisPage", page);
        model.addAttribute("nextPage", page + 1);
        model.addAttribute("finalPage", orderCount / 8);

        model.addAttribute("orderCount", orderCount);
        model.addAttribute("classroomList", classroomList);
        model.addAttribute("cid", cid);
        model.addAttribute("startdate", startdate);
        model.addAttribute("orderList", list);
        return "personalOrder";
    }

    @RequestMapping("/student/exportWord")
    public String exportDocument(Model model, @RequestParam("orderid") Integer orderid, HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("studentSession");
        if (session == null || student == null) {
            return "login";
        }
        session.setAttribute("studentSession", student);
        model.addAttribute("student", student);

        Integer max_count = orderService.getAcceptOrderCount();

        Ordercr ordercr = orderService.getOrderById(orderid);
        WordUtils test = new WordUtils(freeMarkerConfigurer, max_count);
        try {
            test.exportMillCertificateWord(request, response, ordercr, student.getSname());
        } catch (Exception e) {
            e.printStackTrace();
        }

        //test.createWord(ordercr, student.getSname());
        return "personalOrder";
    }

}
