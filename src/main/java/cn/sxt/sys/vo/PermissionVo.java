package cn.sxt.sys.vo;

import cn.sxt.sys.domain.Permission;

public class PermissionVo extends Permission{
	private String  permissionIds;
	
	private Integer page;//第几页
	private Integer limit;//每页几条数据
	public String getPermissionIds() {
		return permissionIds;
	}
	public void setPermissionIds(String permissionIds) {
		this.permissionIds = permissionIds;
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
