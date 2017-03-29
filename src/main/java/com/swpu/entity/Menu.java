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
	
	private Integer menuId;
	private String name;
	private String url;
	private String parentId;
	private String order;
	private String icon;
	private String type;
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
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
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
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
