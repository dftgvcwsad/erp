package cn.sxt.sys.utils;

import java.util.List;

import cn.sxt.sys.domain.User;

public class ActiverUser {
	private User cunuser;
	private List<String> roles;
	private List<String> permissions;
	
	public User getCunuser() {
		return cunuser;
	}
	public void setCunuser(User cunuser) {
		this.cunuser = cunuser;
	}
	public List<String> getRoles() {
		return roles;
	}
	public void setRoles(List<String> roles) {
		this.roles = roles;
	}
	public List<String> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<String> permissions) {
		this.permissions = permissions;
	}
	public ActiverUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ActiverUser(User cunuser, List<String> roles, List<String> permissions) {
		super();
		this.cunuser = cunuser;
		this.roles = roles;
		this.permissions = permissions;
	}
	
}
