package com.swpu.entity;
/** 
* @author  cy
* @createDate 2017年1月25日 上午10:40:06 
* @version 1.0 
* @describe  
*/
public class Role {
	
	private Integer roleid;
	private String rolename;
	private String description;
	private String state;
	
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
