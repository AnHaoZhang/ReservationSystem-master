package pojo;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

public class ItemDate implements Serializable
{
    private List<ItemTime> orderTimeList;
    private Integer dateCount[];



    public List<ItemTime> getOrderTimeList()
    {
        return orderTimeList;
    }

    public void setOrderTimeList(List<ItemTime> orderTimeList)
    {
        this.orderTimeList = orderTimeList;
    }

    public Integer[] getDateCount()
    {
        return dateCount;
    }

    public void setDateCount(Integer[] dateCount)
    {
        this.dateCount = dateCount;
    }

    @Override
    public String toString()
    {
        return "ItemDate{" +
                ", orderTimeList=" + orderTimeList +
                ", dateCount=" + Arrays.toString(dateCount) +
                '}';
    }
}
