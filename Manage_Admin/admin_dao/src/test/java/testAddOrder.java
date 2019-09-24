import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class testAddOrder
{
    @Test
    public  void  testAdd()
    {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext-service.xml");
    }
}
