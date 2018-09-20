package cn.sxt.sys.service;

import cn.sxt.sys.domain.Notice;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.NoticeVo;

public interface NoticeService {

	DataGridView queryAllNotice(NoticeVo noticeVo);

	int addNotice(NoticeVo noticeVo);
	
	Notice queryNoticeById(Integer id);

	int updateNotice(NoticeVo noticeVo);

	int deleteNotice(Integer noticeId);
}
