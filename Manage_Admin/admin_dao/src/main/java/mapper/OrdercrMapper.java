package mapper;

import org.apache.ibatis.annotations.Param;
import pojo.Ordercr;
import pojo.OrdercrExample;

import java.util.List;

public interface OrdercrMapper {
    int countByExample(OrdercrExample example);

    int deleteByExample(OrdercrExample example);

    int deleteByPrimaryKey(Integer orderid);

    int insert(Ordercr record);

    int insertSelective(Ordercr record);

    List<Ordercr> selectByExampleWithBLOBs(OrdercrExample example);

    List<Ordercr> selectByExample(OrdercrExample example);

    Ordercr selectByPrimaryKey(Integer orderid);

    int updateByExampleSelective(@Param("record") Ordercr record, @Param("example") OrdercrExample example);

    int updateByExampleWithBLOBs(@Param("record") Ordercr record, @Param("example") OrdercrExample example);

    int updateByExample(@Param("record") Ordercr record, @Param("example") OrdercrExample example);

    int updateByPrimaryKeySelective(Ordercr record);

    int updateByPrimaryKeyWithBLOBs(Ordercr record);

    int updateByPrimaryKey(Ordercr record);
}