package cn.sxt.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.sys.domain.Dept;
import cn.sxt.sys.mapper.DeptMapper;
import cn.sxt.sys.service.DeptService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.DeptVo;

@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptMapper deptMapper;

	@Override
	public List<Dept> queryAllDeptForTree(DeptVo deptVo) {
		return deptMapper.queryAllDept(deptVo);
	}

	@Override
	public DataGridView queryAllDept(DeptVo deptVo) {
		Page<Object> page = PageHelper.startPage(deptVo.getPage(), deptVo.getLimit());
		List<Dept> allDept = deptMapper.queryAllDept(deptVo);
		return new DataGridView(page.getTotal(), allDept);
	}

	@Override
	public int addDept(DeptVo deptVo) {
		return deptMapper.insertSelective(deptVo);
	}

	@Override
	public Dept queryDeptById(Integer id) {
		return deptMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateDept(DeptVo deptVo) {
		return deptMapper.updateByPrimaryKeySelective(deptVo);
	}

	@Override
	public int deleteDept(Integer deptId) {
		return deptMapper.deleteByPrimaryKey(deptId);
	}

}
