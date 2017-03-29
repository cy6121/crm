package com.swpu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.Role;
import com.swpu.service.RoleService;

/** 
* @author  cy
* @createDate 2017年3月26日 下午7:49:23 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/system/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public String roleList(){
		return "system/role/list";
	}
	
	@RequestMapping(value = "roles.json", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> load(HttpServletRequest request) {
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		
		Map<String, Object> map = Maps.newHashMap();
		List<Role> roleList = roleService.selectAll();
        
		map.put("draw",draw);
		map.put("data", roleList);
		return map;
	}
	
	@RequestMapping(value = "addRole",method = RequestMethod.POST)
	@ResponseBody
	public String addUser(Role role){
		role.setRolename(role.getRolename().trim());
		role.setDescription(role.getDescription().trim());
		roleService.save(role);
		return "success";
	}
	
	@RequestMapping(value = "role.json" , method = RequestMethod.GET)
	@ResponseBody
	public Role getUserInfo(Integer roleid){
		return roleService.selectOne(roleid);
	}
	
	@RequestMapping(value = "edit" , method = RequestMethod.POST)
	@ResponseBody
	public String edit(Role role){
		role.setRolename(role.getRolename().trim());
		role.setDescription(role.getDescription().trim());
		roleService.updateRole(role);
		return "success";
	}
	
	@RequestMapping(value = "del" , method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer roleid){
		roleService.deleteRole(roleid);
		return "success";
	}
}
