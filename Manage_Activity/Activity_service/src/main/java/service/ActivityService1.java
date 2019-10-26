package service;


import pojo.ActivityPageBean;

import java.text.ParseException;

public interface ActivityService1
{
    ActivityPageBean getActivityPageBean(Integer pageSize, Integer currentPage, String nowDate) throws ParseException;
}
