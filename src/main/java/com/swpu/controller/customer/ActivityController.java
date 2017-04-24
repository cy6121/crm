package com.swpu.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swpu.entity.Activity;
import com.swpu.service.ActivityService;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/customer/activity")
public class ActivityController {
	
	@Autowired
	private ActivityService activityService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String ActivityList(Integer cust_id,String name,Model model) {
		List<Activity> activityList = activityService.selectActivityByCust(cust_id);
		model.addAttribute("activityList",activityList);
		model.addAttribute("cust_name",name);
		model.addAttribute("cust_id",cust_id);
		return "customer/activity/list";
	}
	
	@RequestMapping(value = "data.json",method = RequestMethod.GET)
	@ResponseBody
	public Activity dataOne(Integer atv_id){
		return activityService.selectActivityById(atv_id);
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	@ResponseBody
	public String add(Activity activity){
		activityService.insertActivity(activity);
		return "success";
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	@ResponseBody
	public String edit(Activity activity){
		activityService.updateActivity(activity);
		return "success";
	}
	
	@RequestMapping(value = "del",method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer atv_id){
		activityService.deleteActivity(atv_id);
		return "success";
	}
	
}
