package com.swpu.entity;

import java.util.List;

/** 
* @author  cy
* @createDate 2017年4月23日 下午5:07:40 
* @version 1.0 
* @describe  
*/
public class Order {
	private Integer odr_id;
	private Integer cust_id;
	private String odr_date;
	private String address;
	private String state;
	private List<OrderItem> items;
	public Integer getOdr_id() {
		return odr_id;
	}
	public void setOdr_id(Integer odr_id) {
		this.odr_id = odr_id;
	}
	public Integer getCust_id() {
		return cust_id;
	}
	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}
	public String getOdr_date() {
		return odr_date;
	}
	public void setOdr_date(String odr_date) {
		this.odr_date = odr_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public List<OrderItem> getItems() {
		return items;
	}
	public void setItems(List<OrderItem> items) {
		this.items = items;
	}
	
}
