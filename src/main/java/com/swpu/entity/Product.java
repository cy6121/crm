package com.swpu.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/** 
* @author  cy
* @createDate 2017年4月11日 下午8:58:23 
* @version 1.0 
* @describe  
*/
public class Product implements Serializable{

	private static final long serialVersionUID = -4830916491723082121L;
	
	private Integer prodId;
	private String name;
	private String type;
	//产品批次
	private String batch;
	//产品单位
	private String unit;
	private BigDecimal price;
	//产品备注
	private String memo;
	public Integer getProdId() {
		return prodId;
	}
	public void setProdId(Integer prodId) {
		this.prodId = prodId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBatch() {
		return batch;
	}
	public void setBatch(String batch) {
		this.batch = batch;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo.trim();
	}
}
