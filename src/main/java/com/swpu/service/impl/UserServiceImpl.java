package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Strings;
import com.swpu.entity.User;
import com.swpu.mapper.UserMapper;
import com.swpu.service.UserService;

/** 
* @author  cy
* @createDate 2017年1月15日 下午3:05:24 
* @version 1.0 
* @describe  
*/
@Service
public class UserServiceImpl implements UserService{
	
	@Value("${user.salt}")
	private String passwordSalt;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User getUserByNameAndPwd(User user){
		return userMapper.getUserByNameAndPwd(user);
	}

	/* 捕获异常，防止程序不能向下继续运行，出现假死现象,，默认对运行期例外进行事物回滚
	 * @see com.swpu.service.UserService#updateUser(com.swpu.entity.User)
	 */
	@Transactional
	@Override
	public boolean updateUser(User user) {
		if (!Strings.isNullOrEmpty(user.getPassword())) {
			user.setPassword(DigestUtils.md5Hex(user.getPassword() + passwordSalt));
		}
		try {
			int row = userMapper.updateUser(user);
			if (row > 0) {
				return true;
			}
		} catch (Exception e) {
			return false;
		}
		return false;
	}

	@Override
	public User getUserByUserId(Integer userid) {
		return userMapper.getUserByUserId(userid);
	}

	@Override
	public List<User> getAllUserByParam(Map<String,Object> param){
		return userMapper.getAllUserByParam(param);
	}

	@Override
	public int findUserCount() {
		return userMapper.findUserCount();
	}

	@Override
	public int findUserCountByParam(Map<String, Object> param) {
		return userMapper.findUserCountByParam(param);
	}

	@Transactional
	@Override
	public void addUser(User user,String[] role) {
		
		user.setPassword(DigestUtils.md5Hex(user.getPassword() + passwordSalt));
		user.setState(User.USER_STATE_OK);
		userMapper.addUser(user);
		
		if (role!=null) {
			userMapper.addUserRole(user,role);
		}
	}

	@Override
	public User getUserAndRoleByUserId(Integer userid) {
		return userMapper.getUserAndRoleByUserId(userid);
	}

	@Transactional
	@Override
	public void editUser(User user, String[] role) {
		
		userMapper.delUserAndRole(user.getUserid());
		userMapper.editUser(user);
		userMapper.addUserRole(user,role);
	}
	
	@Transactional
	@Override
	public void delUser(Integer userid) {
		userMapper.delUser(userid);
		userMapper.delUserAndRole(userid);
	}

}
