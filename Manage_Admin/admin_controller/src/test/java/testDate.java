import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class testDate
{
    @Test
    public  void  testDate()
    {
        System.out.println(new Date());
    }
    @Test
    public  void  testDatOption() throws InterruptedException
    {

        Date nowDate=new Date();
        Thread.sleep(1000);
        Date createDate=new Date();
        System.out.println(createDate.getTime()-nowDate.getTime());
    }
    @Test
    public  void  testGetTime() throws InterruptedException
    {
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date startDate=new Date();

        Thread.sleep(5000);
        Date endDate=new Date();
        Calendar gregorianCalendar = new GregorianCalendar();
        gregorianCalendar.setTime(endDate);
        gregorianCalendar.add(Calendar.HOUR,1);
        endDate= gregorianCalendar.getTime();
        System.out.println(dateFormat.format(endDate));
    }
    @Test
    public  void  testDateGet()
    {
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date startDate=new Date();
        String start = dateFormat.format(startDate);
        System.out.println(start);
        System.out.println(start.substring(11,12));
        String[] dateTable={"08","09","10 ","11","12","13","14","15","21"};
        ArrayList<String> arrayList=new ArrayList<String>();
        for (int i=0;i<dateTable.length;i++)
        {
            arrayList.add(dateTable[i]);
        }
        int i = arrayList.indexOf(start.substring(11, 13));
        System.out.println(i);

    }
}
