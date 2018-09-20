package cn.sxt.sys.mapper;

import java.util.List;

import cn.sxt.sys.domain.Notice;
import cn.sxt.sys.vo.NoticeVo;

public interface NoticeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKeyWithBLOBs(Notice record);

    int updateByPrimaryKey(Notice record);
    
    List<Notice> queryAllNotice(NoticeVo noticeVo);
}