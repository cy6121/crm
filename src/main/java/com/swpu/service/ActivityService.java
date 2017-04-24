package com.swpu.service;

import java.util.List;

import com.swpu.entity.Activity;

/** 
* @author  cy
* @createDate 2017年4月11日 下午9:04:20 
* @version 1.0 
* @describe  
*/
public interface ActivityService {
	
	List<Activity> selectActivityByCust(Integer cust_id);
	
	Activity selectActivityById(Integer atv_id);
	
	void updateActivity(Activity activity);
	
	void insertActivity(Activity activity);
	
	void deleteActivity(Integer atv_id);
}
