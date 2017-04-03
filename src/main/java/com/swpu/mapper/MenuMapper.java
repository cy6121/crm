package com.swpu.mapper;

import java.util.List;
import java.util.Map;

import com.swpu.entity.Menu;

/** 
* @author  cy
* @createDate 2017年2月18日 下午4:31:52 
* @version 1.0 
* @describe  
*/
public interface MenuMapper {

	/** 根据角色获取资源
	 * @return
	 */
	List<Menu> getAuthByRole(Map<String,Object> params);
	
	/** 获取所有资源(菜单或者权限控制)
	 * @return
	 */
	List<Menu> getALLAuth(Map<String,Object> params);
	
}
