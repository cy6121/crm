package com.swpu.entity;
/** 
* @author  cy
* @createDate 2017年4月24日 下午8:43:59 
* @version 1.0 
* @describe  
*/
public class Drain {
	private Integer drain_id;
	private Customer customer;
	private String last_order_date;
	private String lost_date;
	private String delay;//暂缓措施
	private String reason;//流失原因
	private String state;//状态
	public Integer getDrain_id() {
		return drain_id;
	}
	public void setDrain_id(Integer drain_id) {
		this.drain_id = drain_id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getLast_order_date() {
		return last_order_date;
	}
	public void setLast_order_date(String last_order_date) {
		this.last_order_date = last_order_date;
	}
	public String getLost_date() {
		return lost_date;
	}
	public void setLost_date(String lost_date) {
		this.lost_date = lost_date;
	}
	public String getDelay() {
		return delay;
	}
	public void setDelay(String delay) {
		this.delay = delay.trim();
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason.trim();
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
