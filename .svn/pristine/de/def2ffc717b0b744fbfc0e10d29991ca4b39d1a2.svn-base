package cn.sxt.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.sys.domain.Notice;
import cn.sxt.sys.mapper.NoticeMapper;
import cn.sxt.sys.service.NoticeService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public DataGridView queryAllNotice(NoticeVo noticeVo) {
		Page<Object> page = PageHelper.startPage(noticeVo.getPage(), noticeVo.getLimit());
		List<Notice> allNotice = noticeMapper.queryAllNotice(noticeVo);
		return new DataGridView(page.getTotal(), allNotice);
	}

	@Override
	public int addNotice(NoticeVo noticeVo) {
		return noticeMapper.insertSelective(noticeVo);
	}

	@Override
	public Notice queryNoticeById(Integer id) {
		return noticeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateNotice(NoticeVo noticeVo) {
		return noticeMapper.updateByPrimaryKeySelective(noticeVo);
	}

	@Override
	public int deleteNotice(Integer noticeId) {
		return noticeMapper.deleteByPrimaryKey(noticeId);
	}

}
