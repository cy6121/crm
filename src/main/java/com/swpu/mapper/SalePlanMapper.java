package com.swpu.mapper;

import java.util.List;
import java.util.Map;

import com.swpu.entity.SalePlan;

/** 
* @author  cy
* @createDate 2017年4月11日 下午9:04:20 
* @version 1.0 
* @describe  
*/
public interface SalePlanMapper {
	
	List<SalePlan> selectSalePlanById(Integer sale_id);
	
	void updateSalePlan(Map<String,Object> param);
	
	void insertSalePlan(SalePlan salePlan);
	
	void deletePlan(Integer plan_id);
}
