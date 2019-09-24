package mapper;

import pojo.AdminOrderPageBean;
import pojo.Administrator;
import pojo.Ordercr;
import java.util.List;

public interface AdminOrderMapper
{
    List<Ordercr> getAdminOrderPageBean(AdminOrderPageBean pageBean);
    List<String> selectAllAdmin();
}
