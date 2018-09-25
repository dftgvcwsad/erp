package cn.sxt.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.sys.domain.LeaveBill;
import cn.sxt.sys.mapper.LeaveBillMapper;
import cn.sxt.sys.service.LeaveBillService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.LeaveBillVo;

@Service
public class LeaveBillServiceImpl implements LeaveBillService {

	@Autowired
	private LeaveBillMapper leaveBillMapper;

	@Override
	public DataGridView queryAllLeaveBill(LeaveBillVo leaveBillVo) {
		Page<Object> page = PageHelper.startPage(leaveBillVo.getPage(), leaveBillVo.getLimit());
		List<LeaveBillVo> allLeaveBill = leaveBillMapper.queryAllLeaveBill(leaveBillVo);
		return new DataGridView(page.getTotal(), allLeaveBill);
	}

	@Override
	public int addLeaveBill(LeaveBillVo leaveBillVo) {
		return leaveBillMapper.insertSelective(leaveBillVo);
	}

	@Override
	public LeaveBill queryLeaveBillById(Integer id) {
		return leaveBillMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateLeaveBill(LeaveBillVo leaveBillVo) {
		return leaveBillMapper.updateByPrimaryKeySelective(leaveBillVo);
	}

	@Override
	public int deleteLeaveBill(Integer leaveBillId) {
		return leaveBillMapper.deleteByPrimaryKey(leaveBillId);
	}

}
