package service;


import pojo.ActivityPageBean;

public interface ActivityService
{
    ActivityPageBean getActivityPageBean(Integer pageSize, Integer currentPage, String nowDate);
}
