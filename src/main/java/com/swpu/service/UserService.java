package com.swpu.service;

import java.util.List;
import java.util.Map;

import com.swpu.entity.User;

/** 
* @author  cy
* @createDate 2017年1月15日 下午3:04:36 
* @version 1.0 
* @describe  
*/
public interface UserService {
	
	/** 根据用户名获取用户
	 * @param user
	 * @return
	 * @throws Exception 
	 */
	User getUserByName(String username);
	
	/** 更新用户信息
	 * @param user
	 * @return
	 */
	boolean updateUser(User user);
	
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
	void addUser(User user,String[] roleid);
	
	/** 修改用户信息
	 * @param user
	 * @param role
	 */
	void editUser(User user,String[] role);
	
	/** 删除用户信息
	 * @param userid
	 */
	void delUser(Integer userid);
	
	List<User> getUserByUserRole(String rolename);
}
