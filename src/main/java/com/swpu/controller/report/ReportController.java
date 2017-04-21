package com.swpu.controller.report;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/report")
public class ReportController {
	@RequestMapping(value = "consist", method = RequestMethod.GET)
	public String consist() {
		
		return "report/consist";
	}
	
	@RequestMapping(value = "drain", method = RequestMethod.GET)
	public String contactList() {
		
		return "report/drain";
	}
	
	@RequestMapping(value = "pay", method = RequestMethod.GET)
	public String pay() {
		
		return "report/pay";
	}
	
	@RequestMapping(value = "service", method = RequestMethod.GET)
	public String service() {
		
		return "report/service";
	}
}
