package cn.sxt.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.bus.domain.Outport;
import cn.sxt.bus.mapper.OutportMapper;
import cn.sxt.bus.service.OutportService;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.OutportVo;

@Service
public class OutportServiceImpl implements OutportService {
	
	@Autowired
	private OutportMapper outportMapper;

	@RequestMapping("toOutportManager")
	public String toOutportManager() {
		return "busness/outport/outportManager";
	}
	
	@Override
	public DataGridView queryAllOutport(OutportVo outportVo) {
		Page<Object> page = PageHelper.startPage(outportVo.getPage(), outportVo.getLimit());
		List<Outport> outports = outportMapper.queryAllOutport(outportVo);
		return new DataGridView(page.getTotal(), outports);
	}

	@Override
	public int addOutport(OutportVo outportVo) {
		return outportMapper.insertSelective(outportVo);
	}

	@Override
	public int updateOutport(OutportVo outportVo) {
		return outportMapper.updateByPrimaryKeySelective(outportVo);
	}

	@Override
	public int deleteOutport( Integer id) {
		return outportMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Outport queryOutportById(Integer id) {
		return outportMapper.selectByPrimaryKey(id);
	}
	
}
