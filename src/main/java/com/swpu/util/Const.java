package com.swpu.util;
/** 
* @author  cy
* @createDate 2017年4月8日 下午10:42:47 
* @version 1.0 
* @describe  
*/
public class Const {
	public static final String SESSION_USER = "curr_user";
	public static final String USER_STATE_OK = "1";
	public static final String USER_STATE_DISABLE = "0";
	public static final String SESSION_ROLE = "curr_user_role";
	public static final String SESSION_MENU_KEY = "menuList";
	public static final String SESSION_SUBMENU_KEY = "submenuList";
	public static final String AuthType_Menu = "menu";		//授权类型:菜单类型
	public static final String AuthType_Permission = "permission";//授权类型:权限类型
	public static final String NO_INTERCEPTOR_PATH = ".*/((login)|(logout)|(static)|(plugins)).*";
}
