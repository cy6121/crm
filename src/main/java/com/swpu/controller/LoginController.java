package com.swpu.controller;

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

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.swpu.entity.Menu;
import com.swpu.entity.User;
import com.swpu.service.MenuService;

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
	@RequestMapping(value = "login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> login(String username, String password) {

		String errInfo = "";
		Map<String, Object> map = Maps.newHashMap();
		// 获取认证主体，如果当前主体已经存在，则退出当前主体
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout();
		}
		try {
			String pwd = DigestUtils.md5Hex(password + passwordSalt);
			UsernamePasswordToken token = new UsernamePasswordToken(username, pwd);
			subject.login(token);
			Session session = subject.getSession();// session默认会话时间半小时
			User user = (User) subject.getPrincipal();
			session.setAttribute(User.SESSION_KEY, user);
			errInfo = "success";
		} catch (LockedAccountException e) {
			errInfo = "disable";
		} catch (AuthenticationException e) {
			errInfo = "userError";
		}
		map.put("result", errInfo);
		return map;
	}

	/** 主页
	 * @return
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String home() {
		List<Menu> menuList = Lists.newLinkedList();
		List<Menu> submenuList = Lists.newLinkedList();
		boolean isAdmin = false;//判断是否有管理员权限
		Subject subject = SecurityUtils.getSubject();
		
		if (subject.hasRole("管理员")) {
			isAdmin = !isAdmin;
		}
		
		List<Menu> menus = menuService.getMenu();
		if (menus!=null) {
			for (Menu menu : menus) {
				if (isAdmin) {
					if (menu.getParentId().equals("0")) {
						menuList.add(menu);
					}else{
						submenuList.add(menu);
					}
				}else{
					if (menu.getParentId().equals("0") && !menu.getType().equals("1")) {
						menuList.add(menu);
					}else if (!menu.getParentId().equals("1") && !menu.getType().equals("1")) {
						submenuList.add(menu);
					}
				}
			}
			Session session = subject.getSession();
			session.setAttribute(Menu.SESSION_MENU_KEY,menuList);
			session.setAttribute(Menu.SESSION_SUBMENU_KEY,submenuList);
		}
		
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
