package mapper;

import org.apache.ibatis.annotations.Param;
import pojo.Notice;

import java.util.List;

public interface NoticeItemsMapper {
    public List<Notice> getNotice();

    public List<Notice> getNoticeByPage(@Param("offset")Integer offset, @Param("limit")Integer limit);
}
