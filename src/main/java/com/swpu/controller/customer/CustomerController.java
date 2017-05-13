package com.swpu.controller.customer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.Customer;
import com.swpu.entity.Dict;
import com.swpu.service.CustomerService;
import com.swpu.service.DictService;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private DictService dictService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String customerList() {
		
		return "customer/list";
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
        String cust_name = request.getParameter("cust_name");
        String manager_name = request.getParameter("manager_name");
        String state = request.getParameter("state");
        
        Map<String,Object> param = Maps.newHashMap();
        param.put("manager_name",manager_name);
        param.put("currentPage",currentPage);
		param.put("pageNum",pageNum);
		param.put("cust_name",cust_name);
		param.put("state",state);
        
		Map<String,Object> map = Maps.newHashMap();
		List<Customer> datas = customerService.selectCustomerALL(param);
		Integer count = customerService.findCustomerCount();
		Integer recordsFiltered = customerService.findCustomerCountByParam(param);
		map.put("data",datas);
		map.put("draw",draw);
		map.put("recordsTotal",count);//总记录数
		map.put("recordsFiltered",recordsFiltered);
		return map;
	}
	
	@RequestMapping(value = "edit/{cust_id}",method = RequestMethod.GET)
	public String dataOne(@PathVariable("cust_id") Integer cust_id,Model model){
		Customer customer = customerService.selectCustomerById(cust_id);
		List<Dict> regionList = dictService.findDictByType("地区");
		List<Dict> levelList = dictService.findDictByType("客户等级");
		List<Dict> satisfyList = dictService.findDictByType("客户满意度");
		List<Dict> creditList = dictService.findDictByType("客户信用度");
		model.addAttribute("customer",customer);
		model.addAttribute("regionList",regionList);
		model.addAttribute("levelList",levelList);
		model.addAttribute("satisfyList",satisfyList);
		model.addAttribute("creditList",creditList);
		return "customer/edit";
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	@ResponseBody
	public String edit(Customer customer){
		customerService.updateCustomer(customer);
		return "success";
	}
}
