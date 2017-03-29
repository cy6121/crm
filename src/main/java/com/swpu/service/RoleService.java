package com.swpu.service;

import java.util.List;

import com.swpu.entity.Role;

/** 
* @author  cy
* @createDate 2017年3月26日 下午4:28:08 
* @version 1.0 
* @describe  
*/
public interface RoleService {
	/**根据用户id查询相应角色列表
	 * @param userId
	 * @return
	 */
	List<Role> findByUserId(Integer userId);
	
	
	/**查询所有角色
	 * @return
	 */
	List<Role> selectAll();
	
	/**添加角色
	 * @param role
	 */
	void save(Role role);
	
	/**查询相应角色
	 * @param roleid
	 * @return
	 */
	Role selectOne(Integer roleid);
	
	void updateRole(Role role);
	
	void deleteRole(Integer roleid);
}
