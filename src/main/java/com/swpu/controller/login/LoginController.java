package com.swpu.controller.login;

import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.Menu;
import com.swpu.entity.User;
import com.swpu.service.MenuService;
import com.swpu.util.Const;

/**
 * @author cy
 * @createDate 2017年3月26日 下午2:12:52
 * @version 1.0
 * @describe
 */

@Controller
@RequestMapping("/")
public class LoginController {
	
	@Value("${user.salt}")
	private String passwordSalt;

	@Autowired
	private MenuService menuService;
	
	/**
	 * 登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String index() {
		return "login";
	}

	// 通过前端的name属性传值
	/**
	 * 用户登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "login",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(String username, String password) {

		String errInfo = "";
		Map<String, Object> map = Maps.newHashMap();
		Session session = null;
		// 获取认证主体，如果当前主体已经存在，则退出当前主体
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout();
		}
		try {
			String pwd = DigestUtils.md5Hex(password + passwordSalt);
			UsernamePasswordToken token = new UsernamePasswordToken(username, pwd);
			subject.login(token);
			session = subject.getSession();// session默认会话时间半小时
			User user = (User) subject.getPrincipal();
			session.setAttribute(Const.SESSION_USER, user);
		//	session.setAttribute(Const.SESSION_ROLE,user.getRoleList());
			errInfo = "success";
		} catch (LockedAccountException e) {
			errInfo = "disable";
		} catch (AuthenticationException e) {
			errInfo = "userError";
		}
		map.put("result", errInfo);
		
		Map<String,Object> params = Maps.newHashMap();
		params.put("roleList",((User) subject.getPrincipal()).getRoleList());
		params.put("isSubMenu",false);
		
		List<Menu> menuList = menuService.getMenu(params);
		params.put("isSubMenu",true);
		List<Menu> submenuList = menuService.getMenu(params);
		session.setAttribute(Const.SESSION_MENU_KEY,menuList);
		session.setAttribute(Const.SESSION_SUBMENU_KEY,submenuList);
		return map;
	}

	/** 主页
	 * @return
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	/**
	 * 安全退出
	 * 
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "redirect:/login";
	}
	
}
