package com.swpu.controller.system;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import com.swpu.entity.Menu;
import com.swpu.entity.Role;
import com.swpu.service.MenuService;
import com.swpu.service.RoleService;
import com.swpu.util.Const;

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
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value = "",method = RequestMethod.GET)
	public String roleList(){
		return "system/role/list";
	}
	
	@RequestMapping(value = "datas.json", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> dataList(HttpServletRequest request) {
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		
		Map<String, Object> map = Maps.newHashMap();
		List<Role> roleList = roleService.selectAll();
        
		map.put("draw",draw);
		map.put("data", roleList);
		return map;
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	@ResponseBody
	public String add(Role role){
		roleService.save(role);
		return "success";
	}
	
	@RequestMapping(value = "data.json" , method = RequestMethod.GET)
	@ResponseBody
	public Role dataOne(Integer roleid){
		return roleService.selectOne(roleid);
	}
	
	@RequestMapping(value = "edit" , method = RequestMethod.POST)
	@ResponseBody
	public String edit(Role role){
		roleService.updateRole(role);
		return "success";
	}
	
	@RequestMapping(value = "del" , method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer roleid){
		roleService.deleteRole(roleid);
		return "success";
	}
	
	@RequestMapping(value = "auth", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAuth(String type,Integer roleid) {
		
		Map<String, Object> map = Maps.newHashMap();
		Map<String, Object> params = Maps.newHashMap();
		params.put("type","menu");
		params.put("roleid",null);
		List<Menu> menuList= menuService.getALLMenu(params);
		params.put("roleid",roleid);
		List<Menu> userMenuList= menuService.getALLMenu(params);
		for (Menu menu : userMenuList) {
			for (Menu menu2 : menuList) {
				if (menu2.getId().equals(menu.getId())) {
					menu2.setChecked(true);
				}
			}
		}
        map.put("menuList",menuList);
        
		return map;
	}
	
	@RequestMapping(value = "auth", method = RequestMethod.POST)
	@ResponseBody
	public String postAuth(String type,Integer roleid,String ids) {
		String[] menuid = {};
		if(!Strings.isNullOrEmpty(ids)){
			menuid = ids.split(",");
		}
		if (!type.equals(Const.AuthType_Menu)) {
			type = Const.AuthType_Permission;
		}
		roleService.addRoleAuth(roleid,menuid,type);
        
		return "success";
	}
}
