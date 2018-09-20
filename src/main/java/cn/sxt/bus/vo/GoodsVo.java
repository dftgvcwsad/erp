package cn.sxt.bus.vo;

import cn.sxt.bus.domain.Goods;

public class GoodsVo extends Goods{

	private String  goodsIds;
	
	private Integer page;//第几页
	private Integer limit;//每页几条数据
	public String getGoodsIds() {
		return goodsIds;
	}
	public void setGoodsIds(String goodsIds) {
		this.goodsIds = goodsIds;
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
