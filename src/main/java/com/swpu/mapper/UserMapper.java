package com.swpu.mapper;

import java.util.List;
import java.util.Map;

import com.swpu.entity.User;

/** 
* @author  cy
* @createDate 2017年1月15日 下午2:55:40 
* @version 1.0 
* @describe  
*/
public interface UserMapper {
	
	/** 根据用户名获取用户
	 * @param user
	 * @return
	 */
	User getUserByName(String username);
	
	/** 更新用户信息
	 * @param user
	 * @return
	 */
	int updateUser(User user);
	
	/** 根据用户id获取用户
	 * @param userid
	 * @return
	 */
	User getUserByUserId(Integer userid);
	
	/** 获取用户信息(包含角色)
	 * @param userid
	 * @return
	 */
	User getUserAndRoleByUserId(Integer userid);
	
	/** 根据条件获取所有用户
	 * @return
	 */
	List<User> getAllUserByParam(Map<String,Object> param);
	
	/** 获取用户数目
	 * @return
	 */
	int findUserCount();
	
	/** 获取满足条件的用户数目
	 * @return
	 */
	int findUserCountByParam(Map<String,Object> param);
	
	/** 添加用户
	 * @param user
	 * @return
	 */
	void addUser(User user);
	
	/** 添加新用户角色
	 * @param user
	 * @param role
	 */
	void addUserRole(User user,String[] roleid);
	
	/** 修改用户信息
	 * @param user
	 */
	void editUser(User user);
	
	/** 删除用户角色信息
	 * @param userid
	 */
	void delUserAndRole(Integer userid);
	
	/** 删除用户信息
	 * @param userid
	 */
	void delUser(Integer userid);
	
	List<User> getUserByUserRole(String rolename);
	
}
