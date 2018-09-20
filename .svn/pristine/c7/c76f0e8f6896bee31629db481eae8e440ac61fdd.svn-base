package cn.sxt.sys.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import cn.sxt.sys.domain.Notice;

public class NoticeVo extends Notice{
	private String  noticeIds;
	
	private Integer page;//第几页
	private Integer limit;//每页几条数据
	//@DateTimeFormat会将web页面传过来的字符串转换成对应的日期
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endDate;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
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
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public String getNoticeIds() {
		return noticeIds;
	}
	public void setNoticeIds(String noticeIds) {
		this.noticeIds = noticeIds;
	}
	
}
