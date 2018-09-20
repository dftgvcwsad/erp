package cn.sxt.sys.mapper;

import java.util.List;

import cn.sxt.sys.domain.Role;
import cn.sxt.sys.vo.RoleVo;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> queryAllRole(RoleVo roleVo);
  //先清空角色的权限
	void deleteRolePermission(Integer rid);
	//保存角色的权限	
	void saveRolePermission(Integer rid, Integer pid);
	//根据用户id查询角色
	List<Role> queryRoleByUserId(Integer id);
	//先清空用户的角色
	void deleteUserRole(Integer uid);
	//保存用户的角色	
	void saveUserRole(Integer uid, Integer rid);
}