package Impl;

import mapper.OrderItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import pojo.ActivityPageBean;
import pojo.OrderItem;
import service.ActivityService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Service
@Transactional
public class ActivityServiceImpl implements ActivityService
{
    @Autowired
    private OrderItemMapper orderItemMapper;

    @Override
    public ActivityPageBean getActivityPageBean(Integer pageSize, Integer currentPage, String nowDate)
    {
        /*

         * @Author: shize duan

         * @param : pageSIze 页面显示条数 currentPage 当前页面数 nowDate 当天日期

         * @return : ActivityPageBean 页面信息所需要的pageBean

         * @Description:

         * 当nowDate为空时从全部信息获取的页面信息 当nowDate!= null 时 通过日期筛选后获得

         */
        String date;
        ActivityPageBean activityPageBean;
        if(nowDate!=null&&(!StringUtils.isEmpty(nowDate)))
        {
            date=nowDate;
        }
        else
        {
            SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
            date=dateFormat.format(new Date());
        }
        //一天最晚预定时间
        date+=" 00:00:00";
        String endDate=date.substring(0,10)+" 21:00:00";
        int totalCount = orderItemMapper.getActivityTotalCount(date,endDate);
     //   System.out.println(totalCount);
        activityPageBean=new ActivityPageBean(pageSize,currentPage,totalCount);
        Integer start=(activityPageBean.getCurrentPage()-1)*activityPageBean.getPageSize();
        activityPageBean.setStart(start);
        activityPageBean.setNowDate(date);
        activityPageBean.setEndDate(endDate);
        List<OrderItem> orderItemList = orderItemMapper.getActivityPageBean(activityPageBean);
   //     System.out.println(orderItemList.size());
        activityPageBean.setPageList(orderItemList);
        activityPageBean.setNowDate(date.substring(0,10));
        return  activityPageBean;
    }
}
