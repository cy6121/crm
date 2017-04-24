package com.swpu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.Activity;
import com.swpu.mapper.ActivityMapper;
import com.swpu.service.ActivityService;

/** 
* @author  cy
* @createDate 2017年4月23日 下午3:21:11 
* @version 1.0 
* @describe  
*/

@Service
public class ActivityServiceImpl implements ActivityService{

	@Autowired
	private ActivityMapper activityMapper;
	
	@Override
	public List<Activity> selectActivityByCust(Integer cust_id) {
		return activityMapper.selectActivityByCust(cust_id);
	}

	@Override
	public Activity selectActivityById(Integer atv_id) {
		return activityMapper.selectActivityById(atv_id);
	}

	@Transactional
	@Override
	public void updateActivity(Activity activity) {
		activityMapper.updateActivity(activity);
	}

	@Transactional
	@Override
	public void insertActivity(Activity activity) {
		activityMapper.insertActivity(activity);
	}

	@Transactional
	@Override
	public void deleteActivity(Integer atv_id) {
		activityMapper.deleteActivity(atv_id);
	}

}
