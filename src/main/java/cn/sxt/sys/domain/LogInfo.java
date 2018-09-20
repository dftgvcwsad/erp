package cn.sxt.sys.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class LogInfo {
	private Integer id;

	private String loginname;

	private String loginip;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GX+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date logintime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname == null ? null : loginname.trim();
	}

	public String getLoginip() {
		return loginip;
	}

	public void setLoginip(String loginip) {
		this.loginip = loginip == null ? null : loginip.trim();
	}

	public Date getLogintime() {
		return logintime;
	}

	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}
}