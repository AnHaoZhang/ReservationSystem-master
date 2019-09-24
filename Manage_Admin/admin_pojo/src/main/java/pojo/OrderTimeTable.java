package pojo;

import java.io.Serializable;
import java.util.List;

public class OrderTimeTable implements Serializable
{
    private  String cid;
    private  String orderDate;
    private  ItemDate itemDate;

    public String getOrderDate()
    {
        return orderDate;
    }

    public void setOrderDate(String orderDate)
    {
        this.orderDate = orderDate;
    }

    public String getCid()
    {
        return cid;
    }

    public void setCid(String cid)
    {
        this.cid = cid;
    }

    public ItemDate getItemDate()
    {
        return itemDate;
    }

    public void setItemDate(ItemDate itemDate)
    {
        this.itemDate = itemDate;
    }
}
