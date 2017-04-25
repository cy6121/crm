package com.swpu.controller.customer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.Customer;
import com.swpu.entity.Drain;
import com.swpu.entity.User;
import com.swpu.service.CustomerService;
import com.swpu.service.DrainService;
import com.swpu.service.UserService;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/customer/drain")
public class DrainController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DrainService drainService;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String drainList() {
		return "customer/drain/list";
	}
	
	@RequestMapping(value = "datas.json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> dataList(HttpServletRequest request){
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		//当前所在页，第一页为0
        Integer currentPage = Integer.valueOf(request.getParameter("start"));
        //页面最大显示记录数
        Integer pageNum = Integer.valueOf(request.getParameter("length"));
        String cust_name = request.getParameter("cust_name").trim();
        String manager_name = request.getParameter("manager_name").trim();
        String state = request.getParameter("state");
        
        Map<String,Object> param = Maps.newHashMap();
        if (!cust_name.equals("")) {
        	Customer customer = customerService.selectCustomerByName(cust_name);
        	if (customer!=null) {
    			param.put("cust_id",customer.getCust_id());
    		}else{
				param.put("cust_id"," ");
			}
		}
		if (!manager_name.equals("")) {
			User manager = userService.getUserByName(manager_name);
	    	if (manager!=null) {
				param.put("manager_id",manager.getUserid());
			}else{
				param.put("manager_id"," ");
			}
		}
    	
		param.put("currentPage",currentPage);
		param.put("pageNum",pageNum);
		param.put("cust_name",cust_name);
		param.put("state",state);
        
		Map<String,Object> map = Maps.newHashMap();
		List<Drain> datas = drainService.selectDrainALL(param);
		Integer count = drainService.findDrainCount();
		Integer recordsFiltered = drainService.findDrainCountByParam(param);
		map.put("data",datas);
		map.put("draw",draw);
		map.put("recordsTotal",count);//总记录数
		map.put("recordsFiltered",recordsFiltered);
		return map;
	}
	
	@RequestMapping(value = "data.json",method = RequestMethod.GET)
	@ResponseBody
	public Drain dataOne(Integer drain_id){
		return drainService.selectDrainById(drain_id);
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	@ResponseBody
	public String edit(Drain drain){
		drainService.updateDrain(drain);
		return "success";
	}
	
}
