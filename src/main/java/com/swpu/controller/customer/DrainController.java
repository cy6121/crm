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
@RequestMapping("/customer/drain")
public class DrainController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String drainList() {
		
		return "customer/drain/list";
	}
}
