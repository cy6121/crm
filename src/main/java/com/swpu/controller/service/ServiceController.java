package com.swpu.controller.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  服务管理
*/

@Controller
@RequestMapping("/service")
public class ServiceController {
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String create() {
		
		return "service/create";
	}
	
	@RequestMapping(value = "/allot", method = RequestMethod.GET)
	public String allot() {
		
		return "service/allot";
	}
	@RequestMapping(value = "/handle", method = RequestMethod.GET)
	public String handle() {
		
		return "service/handle";
	}
	@RequestMapping(value = "/feedback", method = RequestMethod.GET)
	public String feedback() {
		
		return "service/feedback";
	}
	@RequestMapping(value = "/archive", method = RequestMethod.GET)
	public String archive() {
		
		return "service/archive";
	}
}
