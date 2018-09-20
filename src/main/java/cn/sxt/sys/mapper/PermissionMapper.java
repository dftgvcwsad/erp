package cn.sxt.sys.mapper;

import java.util.List;

import cn.sxt.sys.domain.Permission;
import cn.sxt.sys.vo.PermissionVo;

public interface PermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);
    
    List<Permission> queryAllPermission(PermissionVo permissionVo);
    
	List<Permission> queryPermissionByRoleId(Integer permissionId,Integer roleid);

	List<Permission> queryPermissionByUserId(String type, Integer userid);
}