package cn.sxt.sys.service;

import java.util.List;

import cn.sxt.sys.domain.Permission;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.PermissionVo;

public interface PermissionService {
	//查询全部菜单给超管用的或者拿来查询所有的菜单和权限
	List<Permission> queryAllPermissionForBoss(PermissionVo permissionVo);
	//根据用户id查询菜单
	List<Permission> queryPermissionByUserId(PermissionVo permissionVo,Integer userid);
	
	DataGridView queryAllPermission(PermissionVo permissionVo);

	int addPermission(PermissionVo permissionVo);
	
	Permission queryPermissionById(Integer id);

	int updatePermission(PermissionVo permissionVo);

	int deletePermission(Integer permissionId);
	//查询出角色拥有的权限
	List<Permission> queryPermissionByRoleId(Integer permissionId,Integer roleid);
}
