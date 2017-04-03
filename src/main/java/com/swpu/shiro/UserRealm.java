package com.swpu.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.swpu.entity.User;
import com.swpu.service.UserService;

/** 
* @author  cy
* @createDate 2017年1月25日 上午9:47:37 
* @version 1.0 
* @describe  
*/

@Component
public class UserRealm extends AuthorizingRealm{
	
	@Autowired
	private UserService userService;
	
	/**
     * 权限认证方法
     * @param principalCollection
     * @return
     */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		return null;
	}

	/**
     * 登录方法（身份认证/登录）
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
		String username = token.getUsername();
		String password = new String(token.getPassword());
		User temp = new User();
		temp.setUsername(username);
		temp.setPassword(password);
		User user = userService.getUserByNameAndPwd(temp);
		if(user!=null){
			if(User.USER_STATE_DISABLE.equals(user.getState())){
				throw new LockedAccountException("该账户已被禁用");
			}
			return new SimpleAuthenticationInfo(user,user.getPassword(),getName());
		}
		return null;
	}

}
