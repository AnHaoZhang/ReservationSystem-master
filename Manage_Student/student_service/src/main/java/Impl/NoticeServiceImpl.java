package Impl;

import mapper.NoticeItemsMapper;
import mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Notice;
import pojo.NoticeExample;
import service.NoticeService;

import java.util.List;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    NoticeMapper noticeMapper;

    @Autowired
    NoticeItemsMapper noticeItemsMapper;

    @Override
    public List<Notice> getNotice() {
        return noticeItemsMapper.getNotice();
    }

    @Override
    public List<Notice> getNotice(@RequestParam("page") Integer page) {
        return noticeItemsMapper.getNoticeByPage(8 * (page - 1), 8);
    }

    @Override
    public Integer getNoticeCount() {
        NoticeExample example = new NoticeExample();
        example.createCriteria();
        return noticeMapper.countByExample(example);
    }
}
