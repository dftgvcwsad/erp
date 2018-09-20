package cn.sxt.sys.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.sys.constast.SYS_Constast;
import cn.sxt.sys.domain.Role;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.mapper.RoleMapper;
import cn.sxt.sys.mapper.UserMapper;
import cn.sxt.sys.service.UserService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.JsonIdDispose;
import cn.sxt.sys.utils.Md5Uitls;
import cn.sxt.sys.utils.RandomUtils;
import cn.sxt.sys.vo.RoleVo;
import cn.sxt.sys.vo.UserVo;
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public User queryUserByLoginName(String loginName) {
		return userMapper.queryUserByLoginName(loginName);
	}

	@Override
	public DataGridView queryAllUser(UserVo userVo) {
		Page<Object> page = PageHelper.startPage(userVo.getPage(), userVo.getLimit());
		List<UserVo> allUser = userMapper.queryAllUser(userVo);
		return new DataGridView(page.getTotal(), allUser);
	}

	@Override
	public int addUser(UserVo userVo) {
		return userMapper.insertSelective(userVo);
	}

	@Override
	public User queryUserById(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateUser(UserVo userVo) {
		return userMapper.updateByPrimaryKeySelective(userVo);
	}

	@Override
	public int deleteUser(Integer userId) {
		return userMapper.deleteByPrimaryKey(userId);
	}

	@Override
	public List<UserVo> queryUserBydeptId(UserVo userVo) {
		return userMapper.queryAllUser(userVo);
	}

	@Override
	public List<UserVo> queryAllUserForList() {
		UserVo userVo=new UserVo();
		return userMapper.queryAllUser(userVo);
	}

	@Override
	public int resetUserPwd(UserVo userVo) {
		User user = userMapper.selectByPrimaryKey(userVo.getId());
		user.setSalt(RandomUtils.createRandomUUID());
		user.setPwd(Md5Uitls.encodePwdUseMd5(SYS_Constast.USER_PWD_DEFAULT, user.getSalt(), 2));
		return userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public DataGridView queryUserAllRole(UserVo userVo) {
		List<Role> userRole= roleMapper.queryRoleByUserId(userVo.getId());
		RoleVo roleVo=new RoleVo();
		roleVo.setAvailable(SYS_Constast.MENU_AVAILABLE_YES);
		List<Role> queryAllRole = roleMapper.queryAllRole(roleVo);
		List<RoleVo> roleVos=new ArrayList<>();
		for (Role role1 : queryAllRole) {
			Boolean checked=false;
			if(null!=userRole&&userRole.size()>0) {
				for (Role role2 : userRole) {
					if(role1.getId()==role2.getId()) {
						checked=true;
						break;
					}
				}
			}
			RoleVo rvo=new RoleVo();
			BeanUtils.copyProperties(role1, rvo);
			rvo.setLAY_CHECKED(checked);
			roleVos.add(rvo);
		}
		return new DataGridView(Long.valueOf(roleVos.size()), roleVos);
	}

	@Override
	public int saveUserRole(UserVo userVo) {
		Integer uid=userVo.getId();
		//先清空用户的角色
		roleMapper.deleteUserRole(uid);
		//保存用户的角色
		Integer[] rids = JsonIdDispose.disposeJsonString(userVo.getUserIds());
		if(null!=rids&&rids.length>0) {
			for (Integer rid : rids) {
				roleMapper.saveUserRole(uid, rid);
			}
		}
		return 1;
	}
	

}
