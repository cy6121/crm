package com.swpu.mapper;

import java.util.List;

import com.swpu.entity.Menu;

/** 
* @author  cy
* @createDate 2017年2月18日 下午4:31:52 
* @version 1.0 
* @describe  
*/
public interface MenuMapper {

	/** 获取菜单
	 * @return
	 */
	List<Menu> getMenu();
	
}
