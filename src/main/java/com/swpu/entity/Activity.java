package com.swpu.entity;
/** 
* @author  cy
* @createDate 2017年4月23日 下午3:13:53 
* @version 1.0 
* @describe  
*/
public class Activity {
	private Integer atv_id;//交往记录编号
	private Integer cust_id;//客户编号
	private String atv_date;//时间
	private String place;//地点
	private String title;//概要
	private String description;//描述，详细信息
	public Integer getAtv_id() {
		return atv_id;
	}
	public void setAtv_id(Integer atv_id) {
		this.atv_id = atv_id;
	}
	public Integer getCust_id() {
		return cust_id;
	}
	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}
	public String getAtv_date() {
		return atv_date;
	}
	public void setAtv_date(String atv_date) {
		this.atv_date = atv_date;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description.trim();
	}
}
