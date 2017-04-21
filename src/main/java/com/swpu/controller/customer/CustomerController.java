package com.swpu.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String customerList() {
		
		return "customer/list";
	}
	
	@RequestMapping(value = "contact", method = RequestMethod.GET)
	public String contactList() {
		
		return "customer/contact/list";
	}
	
	@RequestMapping(value = "activity", method = RequestMethod.GET)
	public String activityList() {
		
		return "customer/activity/list";
	}
	
	@RequestMapping(value = "order", method = RequestMethod.GET)
	public String orderList() {
		
		return "customer/order/list";
	}
	
	@RequestMapping(value = "drain", method = RequestMethod.GET)
	public String drainList() {
		
		return "customer/drain/list";
	}
}
