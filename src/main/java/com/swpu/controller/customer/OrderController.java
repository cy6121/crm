package com.swpu.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swpu.entity.Order;
import com.swpu.service.OrderService;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/customer/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String OrderList(Integer cust_id,String name,Model model) {
		List<Order> orderList = orderService.selectOrderByCust(cust_id);
		model.addAttribute("orderList",orderList);
		model.addAttribute("cust_name",name);
		model.addAttribute("cust_id",cust_id);
		return "customer/order/list";
	}
	
	@RequestMapping(value = "detail",method = RequestMethod.GET)
	public String detail(Integer odr_id,Model model){
		Order order = orderService.selectOrderById(odr_id);
		model.addAttribute("order",order);
		return "customer/order/detail";
	}
}
