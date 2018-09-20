package cn.sxt.sys.service;

import java.util.List;

import cn.sxt.sys.domain.Role;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.RoleVo;

public interface RoleService {

	List<Role> queryAllRoleForTree(RoleVo roleVo);
	
	DataGridView queryAllRole(RoleVo roleVo);

	int addRole(RoleVo roleVo);
	
	Role queryRoleById(Integer id);

	int updateRole(RoleVo roleVo);

	int deleteRole(Integer roleId);

	int saveRolePermission(RoleVo roleVo);
}
