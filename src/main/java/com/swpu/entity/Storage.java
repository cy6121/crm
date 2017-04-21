package com.swpu.entity;

import java.io.Serializable;

/** 
* @author  cy
* @createDate 2017年4月11日 下午10:04:55 
* @version 1.0 
* @describe  
*/
public class Storage implements Serializable{

	private static final long serialVersionUID = 8819444574635065353L;

	private Integer stkId;//库存编号
	private Product product;//产品
	private String warehouse;//仓库
	private String stkWare;//货位
	private String stkCount;//件数
	private String memo;//备注
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getStkId() {
		return stkId;
	}
	public void setStkId(Integer stkId) {
		this.stkId = stkId;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	public String getStkWare() {
		return stkWare;
	}
	public void setStkWare(String stkWare) {
		this.stkWare = stkWare;
	}
	public String getStkCount() {
		return stkCount;
	}
	public void setStkCount(String stkCount) {
		this.stkCount = stkCount;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo.trim();
	}
}
