import mapper.OrderItemMapper;
import mapper.OrdercrMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.OrderItem;

public class testOrdeItem
{
    @Test
    public  void  testGetOrderItem()
    {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
        OrderItemMapper bean = applicationContext.getBean(OrderItemMapper.class);
       System.out.println(bean.getOrderItemList().get(0).getSname());
    }
}
