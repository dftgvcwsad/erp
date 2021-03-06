package cn.sxt.sys.realm;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.UserService;
import cn.sxt.sys.utils.ActiverUser;

public class UserRealm extends AuthorizingRealm{
	
	@Autowired
	private UserService userService;
	
	@Override
	public String getName() {
		return this.getClass().getSimpleName();
	}
	/**
	 * AuthenticationInfo(认证) 先执行
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String loginName = token.getPrincipal().toString();
		User user = userService.queryUserByLoginName(loginName);
		if(null!=user) {
			//获得数据库的密码（加密的）
			String password=user.getPwd();
			//获得用户拥有的角色
			/*List<Role> roleList = roleService.queryRolesByUserId(user.getUserid());
			List<String> roles=new ArrayList<>();
			for (Role role : roleList) {
				roles.add(role.getRolename());
			}*/
			//获得用户拥有的权限
			/*List<Permission> permissionList = permissionService.queryPermissionsByUserId(user.getUserid());
			List<String> permissions=new ArrayList<>();
			for (Permission permission : permissionList) {
				permissions.add(permission.getPercode());
			}*/
			ActiverUser activerUser=new ActiverUser();
			activerUser.setCunuser(user);
			//使用用户名和地址作为盐
			ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
			AuthenticationInfo info=new SimpleAuthenticationInfo(activerUser, password, credentialsSalt, getName());
			return info;
		}else {
			return null;
		}
	}
	
	/**
	 * AuthorizationInfo(授权)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
