package com.swpu.service;

import java.util.List;

import com.swpu.entity.Menu;

/** 
* @author  cy
* @createDate 2017年2月18日 下午4:58:41 
* @version 1.0 
* @describe  
*/
public interface MenuService {

	/** 获取菜单
	 * @return
	 */
	List<Menu> getMenu();
}
