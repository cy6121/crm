package com.swpu.entity;
/** 
* @author  cy
* @createDate 2017年2月18日 下午4:29:23 
* @version 1.0 
* @describe  
*/
public class Menu {
	
	public static final String SESSION_MENU_KEY = "menuList";
	public static final String SESSION_SUBMENU_KEY = "submenuList";
	public static final String AuthType_Menu = "menu";		//授权类型:菜单类型
	public static final String AuthType_Permission = "permission";//授权类型:权限类型
	
	
	private Integer id;
	private String name;
	private String url;
	private String pId;
	private String order;
	private String icon;
	private String type;
	private boolean checked;
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
