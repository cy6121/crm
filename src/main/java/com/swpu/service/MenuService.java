package com.swpu.service;

import java.util.List;
import java.util.Map;

import com.swpu.entity.Menu;

/** 
* @author  cy
* @createDate 2017年2月18日 下午4:58:41 
* @version 1.0 
* @describe  
*/
public interface MenuService {

	/** 根据用户角色获取菜单
	 * @return
	 */
	List<Menu> getMenu(Map<String,Object> params);
	
	/** 获取所有授权类型(菜单或权限)
	 * @return
	 */
	List<Menu> getALLMenu(Map<String,Object> params);
}
