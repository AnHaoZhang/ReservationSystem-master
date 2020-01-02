package controller.wordexport;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import pojo.Ordercr;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class WordUtils {
    static final int wdDoNotSaveChanges = 0;// 不保存待定的更改。
    static final int wdFormatPDF = 17;// PDF 格式
    private Configuration configuration = null;
    private Integer max_count;

    public WordUtils(FreeMarkerConfigurer freeMarkerConfigurer, Integer max_count) {
        configuration = freeMarkerConfigurer.getConfiguration();
        configuration.setDefaultEncoding("UTF-8");
        this.max_count = max_count;
    }

    public File createWord(Ordercr ordercr, String sname) {
        Map<String, Object> dataMap = new HashMap<String, Object>();
        getData(dataMap, ordercr, sname);
        //configuration.setClassForTemplateLoading(this.getClass(), "classpath:/ftl/");//模板文件所在路径
        Template t = null;
        try {
            t = configuration.getTemplate("创新楼创客教室学生活动备案审批表(2003).ftl"); //获取模板文件
        } catch (IOException e) {
            e.printStackTrace();
        }
        /*/usr/local/dataFile/创新楼创客教室学生活动备案审批表.ftl*/
        File outFile = new File("/usr/local/dataFile/创新力预约系统创新楼创客教室学生活动备案审批表.doc"); //导出文件
        Writer out = null;
        try {
            FileOutputStream fos = new FileOutputStream(outFile);
            OutputStreamWriter oWriter = new OutputStreamWriter(fos, StandardCharsets.UTF_8);
            out = new BufferedWriter(oWriter);
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            t.process(dataMap, out); //将填充数据填入模板文件并输出到目标文件
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return outFile;
    }

    private void getData(Map<String, Object> dataMap, Ordercr ordercr, String sname) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String max_code = "" + (max_count + 1);
        String numId = "";

        Date starttime = null;
        Date endtime = null;
        try {
            starttime = df.parse(ordercr.getStarttime());
            endtime = df.parse(ordercr.getEndtime());
        } catch (Exception e) {
            e.printStackTrace();
        }
        Calendar start = Calendar.getInstance();
        Calendar end = Calendar.getInstance();

        start.setTime(starttime);
        end.setTime(endtime);

        String year = "" + start.get(start.YEAR);
        int month = start.get(start.MONTH) + 1;
        int day = start.get(start.DATE);

        /*String stime = start.get(start.HOUR) + ":" + start.get(start.MINUTE);
        String etime = end.get(end.HOUR) + ":" + end.get(end.MINUTE);*/

        DateFormat codeDf = new SimpleDateFormat("yyyyMMddHH");
        DateFormat codeDf1 = new SimpleDateFormat("HH");
        DateFormat df1 = new SimpleDateFormat("HH:mm");
        String orderId = "" + ordercr.getOrderid();

        while (orderId.length() != 6) {
            orderId = "0" + orderId;
        }

        numId = codeDf.format(starttime) + codeDf1.format(endtime) + orderId;

        dataMap.put("numId", numId);
        dataMap.put("sname", sname);
        dataMap.put("year", year);
        dataMap.put("month", month);
        dataMap.put("day", day);
        dataMap.put("cid", ordercr.getCid());
        dataMap.put("stelphone", ordercr.getStelephone());
        dataMap.put("ttelphone", ordercr.getTtelephone());
        dataMap.put("faculty", ordercr.getFaculty());
        dataMap.put("teacher", ordercr.getTeacher());
        dataMap.put("attendcount", ordercr.getAttendcount());
        dataMap.put("theme", ordercr.getTheme());
        dataMap.put("starttime", df1.format(starttime));
        dataMap.put("endtime", df1.format(endtime));
        dataMap.put("snum", ordercr.getSnum());
        dataMap.put("groupname", ordercr.getGroupname());
    }

    public void exportMillCertificateWord(HttpServletRequest request, HttpServletResponse response, Ordercr ordercr, String sname) throws IOException {
        File file = createWord(ordercr, sname);
        String fileName=file.getName();
        String ext=fileName.substring(fileName.lastIndexOf(".")+1);
        String agent=(String)request.getHeader("USER-AGENT"); //判断浏览器类型
        try {
            if(agent!=null && agent.indexOf("Fireforx")!=-1) {
                fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");   //UTF-8编码，防止输出文件名乱码
            }
            else {
                fileName=URLEncoder.encode(fileName,"UTF-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        BufferedInputStream bis=null;
        OutputStream os=null;
        response.reset();
        response.setCharacterEncoding("utf-8");
        if(ext=="docx") {
            response.setContentType("application/msword"); // word格式
        }else if(ext=="pdf") {
            response.setContentType("application/pdf"); // pdf格式
        }
        response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
        try {
            bis=new BufferedInputStream(new FileInputStream(file));
            byte[] b=new byte[bis.available()+1000];
            int i=0;
            os = response.getOutputStream();   //直接下载导出
            while((i=bis.read(b))!=-1) {
                os.write(b, 0, i);
            }
            os.flush();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(os!=null) {
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}