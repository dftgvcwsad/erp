package cn.sxt.bus.vo;

import cn.sxt.bus.domain.Customer;

public class CustomerVo extends Customer{
	private String  customerIds;
	
	private Integer page;//第几页
	private Integer limit;//每页几条数据
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
	public String getCustomerIds() {
		return customerIds;
	}
	public void setCustomerIds(String customerIds) {
		this.customerIds = customerIds;
	}
	
}
