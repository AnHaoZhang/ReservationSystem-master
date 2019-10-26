package Impl;

import mapper.OrderItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Ordercr;
import redis.clients.jedis.Jedis;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

@Service
@Transactional
public class Redis {

    @Autowired
    OrderItemMapper orderItemMapper;

    public void insert(){
        Jedis jedis = new Jedis("10.16.25.7",6379);
        jedis.flushAll();
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateNowStr = sdf.format(d);
        List<Ordercr> list = orderItemMapper.getOrdbytime(dateNowStr);


        for (int i = 0; i < list.size(); i++) {
            jedis.hset(String.valueOf(i) ,"starttime",list.get(i).getStarttime().toString());
            jedis.hset(String.valueOf(i) ,"endtime",list.get(i).getEndtime().toString());
            jedis.hset(String.valueOf(i) ,"cid",list.get(i).getCid().toString());
            jedis.hset(String.valueOf(i) ,"theme",list.get(i).getTheme().toString());
            jedis.hset(String.valueOf(i) ,"group",list.get(i).getGroupname().toString());
        }
    }
}
