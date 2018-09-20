package cn.sxt.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.sys.domain.Permission;
import cn.sxt.sys.mapper.PermissionMapper;
import cn.sxt.sys.service.PermissionService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.PermissionVo;
@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionMapper;
	@Override
	public List<Permission> queryAllPermissionForBoss(PermissionVo permissionVo) {
		return permissionMapper.queryAllPermission(permissionVo);
	}

	@Override
	public List<Permission> queryPermissionByUserId(PermissionVo permissionVo, Integer userid) {
		return permissionMapper.queryPermissionByUserId(permissionVo.getType(),userid);
	}

	@Override
	public DataGridView queryAllPermission(PermissionVo permissionVo) {
		Page<Object> page = PageHelper.startPage(permissionVo.getPage(), permissionVo.getLimit());
		List<Permission> allPermission = permissionMapper.queryAllPermission(permissionVo);
		return new DataGridView(page.getTotal(), allPermission);
	}

	@Override
	public int addPermission(PermissionVo permissionVo) {
		return permissionMapper.insertSelective(permissionVo);
	}

	@Override
	public Permission queryPermissionById(Integer id) {
		return permissionMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updatePermission(PermissionVo permissionVo) {
		return permissionMapper.updateByPrimaryKeySelective(permissionVo);
	}

	@Override
	public int deletePermission(Integer permissionId) {
		return permissionMapper.deleteByPrimaryKey(permissionId);
	}

	@Override
	public List<Permission> queryPermissionByRoleId(Integer permissionId,Integer roleid) {
		return permissionMapper.queryPermissionByRoleId(permissionId,roleid);
	}
	
	
}
