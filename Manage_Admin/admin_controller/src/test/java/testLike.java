import mapper.OrderItemMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.OrderItem;

import java.util.List;

public class testLike
{
    @Test
    public  void testLikeTest()
    {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
        OrderItemMapper bean = applicationContext.getBean(OrderItemMapper.class);
        List<OrderItem> itemList = bean.getOrderItemByCidAndStartDate("205", "2018-11-16");
        for (OrderItem item:itemList)
        {
            System.out.println(item.getStarttime());
        }
    }
}
