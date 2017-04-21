package com.swpu.entity;

/** 
* @author  cy
* @createDate 2017年4月19日 下午6:55:54 
* @version 1.0 
* @describe  
*/
public class SalePlan {
	private Integer plan_id;
	private Integer sale_id;
	private String plan_date; 
	private String plan_todo;
	private String plan_result;
	public Integer getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(Integer plan_id) {
		this.plan_id = plan_id;
	}
	public Integer getSale_id() {
		return sale_id;
	}
	public void setSale_id(Integer sale_id) {
		this.sale_id = sale_id;
	}
	public String getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(String plan_date) {
		this.plan_date = plan_date;
	}
	public String getPlan_todo() {
		return plan_todo;
	}
	public void setPlan_todo(String plan_todo) {
		this.plan_todo = plan_todo;
	}
	public String getPlan_result() {
		return plan_result;
	}
	public void setPlan_result(String plan_result) {
		this.plan_result = plan_result;
	}
	
}
