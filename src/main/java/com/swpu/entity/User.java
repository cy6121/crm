package com.swpu.entity;

import java.io.Serializable;
import java.util.List;

/**
 * @author cy
 * @createDate 2017年1月15日 下午2:59:17
 * @version 1.0
 * @describe
 */
public class User implements Serializable{
	
	/**
	 * 序列化和反序列化的唯一标识
	 */
	private static final long serialVersionUID = 2778399131582102541L;

	private Integer userid;
	private String username;
	private String password;
	private String name;
	private String sex;
	private String phone;
	private String email;
	private String state;
	private List<Role> roleList;
	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	
}
