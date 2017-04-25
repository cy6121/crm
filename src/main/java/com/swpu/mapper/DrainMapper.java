package com.swpu.mapper;

import java.util.List;
import java.util.Map;

import com.swpu.entity.Drain;

/** 
* @author  cy
* @createDate 2017年4月24日 下午9:46:38 
* @version 1.0 
* @describe  
*/
public interface DrainMapper {
	List<Drain> selectDrainALL(Map<String,Object> param);
	
	Drain selectDrainById(Integer drain_id);
	
	void updateDrain(Drain drain);
	
	void insertDrain();
	
	Integer findDrainCount();
	
	Integer findDrainCountByParam(Map<String,Object> param);
}
