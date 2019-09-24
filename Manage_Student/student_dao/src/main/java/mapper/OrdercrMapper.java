package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pojo.Ordercr;
import pojo.OrdercrExample;

public interface OrdercrMapper {
    int countByExample(OrdercrExample example);

    int deleteByExample(OrdercrExample example);

    int deleteByPrimaryKey(Integer orderid);

    int insert(Ordercr record);

    int insertSelective(Ordercr record);

    List<Ordercr> selectByExample(OrdercrExample example);

    Ordercr selectByPrimaryKey(Integer orderid);

    int updateByExampleSelective(@Param("record") Ordercr record, @Param("example") OrdercrExample example);

    int updateByExample(@Param("record") Ordercr record, @Param("example") OrdercrExample example);

    int updateByPrimaryKeySelective(Ordercr record);

    int updateByPrimaryKey(Ordercr record);

    List selectByExample1(OrdercrExample example);
}