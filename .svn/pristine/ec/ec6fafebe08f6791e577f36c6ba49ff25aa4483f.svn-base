package cn.sxt.bus.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import cn.sxt.bus.domain.Outport;

public class OutportVo extends Outport{
	private String outportIds;

	private String providername;
	private String goodsname;
	private String size;
	// 保存旧的数量方便后台拾取做运算；要减去旧的数量正在添加修改后的新的数量
	private Integer oldumber;

	private Integer page;// 第几页
	private Integer limit;// 每页几条数据
	// @DateTimeFormat会将web页面传过来的字符串转换成对应的日期
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endDate;
	public String getOutportIds() {
		return outportIds;
	}
	public void setOutportIds(String outportIds) {
		this.outportIds = outportIds;
	}
	public String getProvidername() {
		return providername;
	}
	public void setProvidername(String providername) {
		this.providername = providername;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Integer getOldumber() {
		return oldumber;
	}
	public void setOldumber(Integer oldumber) {
		this.oldumber = oldumber;
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
}
