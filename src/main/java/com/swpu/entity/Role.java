package com.swpu.entity;

import java.io.Serializable;

/** 
* @author  cy
* @createDate 2017年1月25日 上午10:40:06 
* @version 1.0 
* @describe  
*/
public class Role implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2395264574694708913L;
	
	private Integer roleid;
	private String rolename;
	private String description;
	
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
		this.description = description.trim();
	}
	
}
