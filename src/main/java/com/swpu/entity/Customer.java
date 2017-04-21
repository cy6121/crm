package com.swpu.entity;
/** 
* @author  cy
* @createDate 2017年4月21日 上午10:10:56 
* @version 1.0 
* @describe  
*/
public class Customer {
	private Integer cust_id;
	private String name;//客户名称
	private String region;//地区
	private Integer manager_id;//客户经理编号
	private String level;//客户等级
	private String satisfy;//客户满意度
	private String credit;//客户信用度
	private String address;//地址
	private String zip;//客户邮政编码
	private String tel;//客户电话
	private String fax;//客户传真
	private String website;//客户网址
	private String lincence_no;//营业执照注册号/统一社会信用代码
	private String chieftain;//法人
	private String bankroll;//注册资金
	private String turnover;//年营业额
	private String bank;//开户银行
	private String bank_account;//银行账户
	private String state;//客户状态
	public Integer getCust_id() {
		return cust_id;
	}
	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public Integer getManager_id() {
		return manager_id;
	}
	public void setManager_id(Integer manager_id) {
		this.manager_id = manager_id;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getSatisfy() {
		return satisfy;
	}
	public void setSatisfy(String satisfy) {
		this.satisfy = satisfy;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getLincence_no() {
		return lincence_no;
	}
	public void setLincence_no(String lincence_no) {
		this.lincence_no = lincence_no;
	}
	public String getChieftain() {
		return chieftain;
	}
	public void setChieftain(String chieftain) {
		this.chieftain = chieftain;
	}
	public String getBankroll() {
		return bankroll;
	}
	public void setBankroll(String bankroll) {
		this.bankroll = bankroll;
	}
	public String getTurnover() {
		return turnover;
	}
	public void setTurnover(String turnover) {
		this.turnover = turnover;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBank_account() {
		return bank_account;
	}
	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
