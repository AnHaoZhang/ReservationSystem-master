import mapper.OrderItemMapper;
import mapper.OrdercrMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Ordercr;

import java.text.SimpleDateFormat;
import java.util.Date;

public class testAddOrder
{
    @Test
    public  void  testAdd()
    {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
        OrdercrMapper  bean = applicationContext.getBean(OrdercrMapper.class);
        Ordercr order=new Ordercr();

        Date createTime=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String testData="11";
        String createTimeString=dateFormat.format(createTime);
        order.setCreatetime(createTimeString);
        order.setEndtime(createTimeString);
        order.setFaculty(testData);
        order.setGroupname(testData);
        order.setOrderstatus(0);
        order.setSnum("2");
        order.setStarttime(createTimeString);
        order.setStelephone(testData);
        order.setTeacher(testData);
        order.setTheme(testData);
        order.setAttendcount(1);
        order.setCid("209");

        bean.insertSelective(order);
    }
    @Test
    public  void  updateOrder()
    {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
        OrderItemMapper  bean = applicationContext.getBean(OrderItemMapper.class);
        bean.updateOrderStatus(3,4);
    }
}
