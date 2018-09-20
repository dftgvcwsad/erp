package cn.sxt.sys.service;


import java.util.List;

import cn.sxt.sys.domain.User;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.UserVo;

public interface UserService {
	//根据登录名查询用户
	User queryUserByLoginName(String loginName);
		
	DataGridView queryAllUser(UserVo userVo);

	int addUser(UserVo userVo);
	
	User queryUserById(Integer id);

	int updateUser(UserVo userVo);

	int deleteUser(Integer userId);

	List<UserVo> queryUserBydeptId(UserVo userVo);
	
	List<UserVo> queryAllUserForList();

	int resetUserPwd(UserVo userVo);

	DataGridView queryUserAllRole(UserVo userVo);

	int saveUserRole(UserVo userVo);
}
