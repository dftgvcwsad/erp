package cn.sxt.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.sys.domain.Role;
import cn.sxt.sys.mapper.RoleMapper;
import cn.sxt.sys.service.RoleService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.JsonIdDispose;
import cn.sxt.sys.vo.RoleVo;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public List<Role> queryAllRoleForTree(RoleVo roleVo) {
		return roleMapper.queryAllRole(roleVo);
	}

	@Override
	public DataGridView queryAllRole(RoleVo roleVo) {
		Page<Object> page = PageHelper.startPage(roleVo.getPage(), roleVo.getLimit());
		List<Role> allRole = roleMapper.queryAllRole(roleVo);
		return new DataGridView(page.getTotal(), allRole);
	}

	@Override
	public int addRole(RoleVo roleVo) {
		return roleMapper.insertSelective(roleVo);
	}

	@Override
	public Role queryRoleById(Integer id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateRole(RoleVo roleVo) {
		return roleMapper.updateByPrimaryKeySelective(roleVo);
	}

	@Override
	public int deleteRole(Integer roleId) {
		return roleMapper.deleteByPrimaryKey(roleId);
	}

	@Override
	public int saveRolePermission(RoleVo roleVo) {
				//得到角色id
				Integer rid=roleVo.getId();
				//得到角色要保存的权限id数组
				Integer[] pids = JsonIdDispose.disposeJsonString(roleVo.getRoleIds());
				//先清空角色的权限
				roleMapper.deleteRolePermission(rid);
				for (Integer pid : pids) {
					//保存角色的权限	
					roleMapper.saveRolePermission(rid, pid);
				}
		
		return 1;
	}

}
