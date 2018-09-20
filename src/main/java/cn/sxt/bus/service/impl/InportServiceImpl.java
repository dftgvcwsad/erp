package cn.sxt.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.bus.domain.Inport;
import cn.sxt.bus.mapper.InportMapper;
import cn.sxt.bus.service.InportService;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.InportVo;

@Service
public class InportServiceImpl implements InportService {
	
	@Autowired
	private InportMapper inportMapper;

	@RequestMapping("toInportManager")
	public String toInportManager() {
		return "busness/inport/inportManager";
	}
	
	@Override
	public DataGridView queryAllInport(InportVo inportVo) {
		Page<Object> page = PageHelper.startPage(inportVo.getPage(), inportVo.getLimit());
		List<Inport> inports = inportMapper.queryAllInport(inportVo);
		return new DataGridView(page.getTotal(), inports);
	}

	@Override
	public int addInport(InportVo inportVo) {
		return inportMapper.insertSelective(inportVo);
	}

	@Override
	public int updateInport(InportVo inportVo) {
		return inportMapper.updateByPrimaryKeySelective(inportVo);
	}

	@Override
	public int deleteInport( Integer id) {
		return inportMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Inport queryInportById(Integer id) {
		return inportMapper.selectByPrimaryKey(id);
	}
	
}
