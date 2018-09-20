package cn.sxt.bus.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Outport {
    private Integer id;

    private String paytype;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GX+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date outporttime;

    private String operateperson;

    private Integer number;

    private String remark;

    private Integer providerid;

    private Integer goodsid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype == null ? null : paytype.trim();
    }

    public Date getOutporttime() {
        return outporttime;
    }

    public void setOutporttime(Date outporttime) {
        this.outporttime = outporttime;
    }

    public String getOperateperson() {
        return operateperson;
    }

    public void setOperateperson(String operateperson) {
        this.operateperson = operateperson == null ? null : operateperson.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getProviderid() {
        return providerid;
    }

    public void setProviderid(Integer providerid) {
        this.providerid = providerid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }
}