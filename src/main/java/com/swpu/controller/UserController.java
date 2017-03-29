package com.swpu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.Role;
import com.swpu.entity.User;
import com.swpu.service.RoleService;
import com.swpu.service.UserService;

/**
 * @author cy
 * @createDate 2017年2月13日 下午5:27:37
 * @version 1.0
 * @describe
 */

@Controller
@RequestMapping("/system/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "information", method = RequestMethod.GET)
	public String goEdit() {
		return "system/user/information";
	}

	@RequestMapping(value = "edit", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object editUser(User user) {

		boolean flag = userService.updateUser(user);
		Map<String, Object> result = Maps.newHashMap();

		// 更新session里的当前用户
		if (flag) {
			result.put("result", "success");
			User newUser = userService.getUserByUserId(user.getUserid());
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			session.setAttribute(User.SESSION_KEY, newUser);
		} else {
			result.put("result", "false");
		}

		return result;
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String userList(Model model) {
		Map<String,Object> map = Maps.newHashMap();
		List<Role> roleList = roleService.selectAll();
		map.put("roleList",roleList);
		model.addAllAttributes(map);
		return "system/user/list";
	}

	@RequestMapping(value = "users.json", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> load(HttpServletRequest request) {
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		//当前所在页，第一页为0
        Integer currentPage = Integer.valueOf(request.getParameter("start"));
        //页面最大显示记录数
        Integer pageNum = Integer.valueOf(request.getParameter("length"));
        String searchValue = request.getParameter("search[value]").trim();
        //排序的队列位置,从0开始
        String orderColumnIndex = request.getParameter("order[0][column]");
        //排序规则,升序或者降序
        String orderType = request.getParameter("order[0][dir]");
        //排序的列名
        String orderColumnName = request.getParameter("columns["+orderColumnIndex+"][name]");
        
		if (StringUtils.isNotEmpty(searchValue)) {
			searchValue = "%" + searchValue + "%";
		}
        
		Map<String,Object> param = Maps.newHashMap();
		param.put("searchValue",searchValue);
		param.put("currentPage",currentPage);
		param.put("pageNum",pageNum);
		param.put("orderColumnName",orderColumnName);
		param.put("orderType",orderType);
		
		Map<String, Object> map = Maps.newHashMap();
		List<User> userList = userService.getAllUserByParam(param);
		int count = userService.findUserCount();
        int recordsFiltered = userService.findUserCountByParam(param);
        
		
		map.put("draw",draw);
		map.put("data", userList);
		map.put("recordsTotal",count);//总记录数
		map.put("recordsFiltered",recordsFiltered);
		
		return map;
	}
	
	@RequestMapping(value = "user.json" , method = RequestMethod.GET)
	@ResponseBody
	public User getUserInfo(Integer userid){
		return userService.getUserAndRoleByUserId(userid);
	}
	
	@RequestMapping(value = "addUser",method = RequestMethod.POST)
	@ResponseBody
	public String addUser(User user,String[] role){
		userService.addUser(user,role);
		return "success";
	}
	
	@RequestMapping(value = "edit" , method = RequestMethod.POST)
	@ResponseBody
	public String edit(User user,String[] role){
		userService.editUser(user,role);
		return "success";
	}
	
	@RequestMapping(value = "del" , method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer userid){
		userService.delUser(userid);
		return "success";
	}
}
