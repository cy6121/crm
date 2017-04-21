package com.swpu.entity;

/** 
* @author  cy
* @createDate 2017年4月18日 下午9:50:08 
* @version 1.0 
* @describe  
*/
public class SaleChance {
	private Integer sale_id;//销售编号
	private String source;//机会来源
	private String cus_name;//客户名称
	private String title;//简要概述
	private Integer rate;//成功概率
	private String contact;//联系人
	private String tel;//联系人电话
	private String description;//机会描述
	private User create;//创建人信息
	private String create_date;//创建时间
	private User allot;//被分配者信息
	private String allot_date;//分配时间
	private String state;//状态
	public Integer getSale_id() {
		return sale_id;
	}
	public void setSale_id(Integer sale_id) {
		this.sale_id = sale_id;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getRate() {
		return rate;
	}
	public void setRate(Integer rate) {
		this.rate = rate;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public User getCreate() {
		return create;
	}
	public void setCreate(User create) {
		this.create = create;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public User getAllot() {
		return allot;
	}
	public void setAllot(User allot) {
		this.allot = allot;
	}
	public String getAllot_date() {
		return allot_date;
	}
	public void setAllot_date(String allot_date) {
		this.allot_date = allot_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
