package com.swpu.mapper;

import java.util.List;

import com.swpu.entity.Role;

/** 
* @author  cy
* @createDate 2017年1月25日 上午10:39:25 
* @version 1.0 
* @describe  
*/
public interface RoleMapper {
	
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
	
	void deleteUserRole(Integer roleid);
	
	void deleteRolePermission(Integer roleid,String type);
	
	/** 添加角色授权(菜单访问权限或者权限控制)
	 * @param roleid
	 * @param menuid
	 */
	void addRoleAuth(Integer roleid,String[] menuid);
	
}
