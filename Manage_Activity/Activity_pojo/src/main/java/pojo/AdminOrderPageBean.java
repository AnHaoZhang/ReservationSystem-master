package pojo;

import java.io.Serializable;
import java.util.List;

public class AdminOrderPageBean implements Serializable
{
    private  String cid;
    private  String orderDate;
    private  Integer pageSize;
    private  Integer currentPage;
    private  Integer totalPage;
    private  Integer totalCount;
    private  Integer start;
    private List pageList;

    public AdminOrderPageBean(Integer pageSize, Integer currentPage, Integer totalCount)
    {

        this.pageSize = pageSize;
        this.currentPage = currentPage;
        this.totalCount = totalCount;
        if(this.pageSize==null)
        {
            this.pageSize=3;
        }
        if(this.currentPage==null)
        {
            this.currentPage=1;
        }
        this.totalPage=(this.totalCount+this.pageSize-1)/this.pageSize;
        if(this.currentPage<1||this.currentPage>this.totalPage)
        {
            this.currentPage=1;
        }
    }

    public String getCid()
    {
        return cid;
    }

    public void setCid(String cid)
    {
        this.cid = cid;
    }

    public String getOrderDate()
    {
        return orderDate;
    }

    public void setOrderDate(String orderDate)
    {
        this.orderDate = orderDate;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }

    public Integer getCurrentPage()
    {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage)
    {
        this.currentPage = currentPage;
    }

    public Integer getTotalPage()
    {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage)
    {
        this.totalPage = totalPage;
    }

    public Integer getTotalCount()
    {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount)
    {
        this.totalCount = totalCount;
    }

    public Integer getStart()
    {
        return start;
    }

    public void setStart(Integer start)
    {
        this.start = start;
    }

    public List getPageList()
    {
        return pageList;
    }

    public void setPageList(List pageList)
    {
        this.pageList = pageList;
    }
}
