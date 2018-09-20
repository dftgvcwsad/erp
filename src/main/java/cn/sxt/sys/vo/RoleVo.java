package cn.sxt.sys.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import cn.sxt.sys.domain.Role;

public class RoleVo extends Role{
	private String  roleIds;
	
	@JsonProperty("LAY_CHECKED")
	private Boolean LAY_CHECKED;
	
	
	public Boolean getLAY_CHECKED() {
		return LAY_CHECKED;
	}
	public void setLAY_CHECKED(Boolean lAY_CHECKED) {
		LAY_CHECKED = lAY_CHECKED;
	}
	private Integer page;//第几页
	private Integer limit;//每页几条数据
	public String getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	
}
