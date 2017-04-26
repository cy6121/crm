package com.swpu.entity;
/** 
* @author  cy
* @createDate 2017年4月25日 下午8:38:04 
* @version 1.0 
* @describe  
*/
public class CstService {
	private Integer svr_id;
	private Customer customer;
	private String type;
	private String title;
	private String state;
	private String request;
	private User create;
	private String create_date;
	private User allot;
	private String allot_date;
	private String deal;//服务处理
	private String deal_date;//处理时间
	private String result;//处理结果
	private String satisfy;//服务满意度
	public Integer getSvr_id() {
		return svr_id;
	}
	public void setSvr_id(Integer svr_id) {
		this.svr_id = svr_id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
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
	public String getDeal() {
		return deal;
	}
	public void setDeal(String deal) {
		this.deal = deal;
	}
	public String getDeal_date() {
		return deal_date;
	}
	public void setDeal_date(String deal_date) {
		this.deal_date = deal_date;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSatisfy() {
		return satisfy;
	}
	public void setSatisfy(String satisfy) {
		this.satisfy = satisfy;
	}
}
