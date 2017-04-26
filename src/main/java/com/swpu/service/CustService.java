package com.swpu.service;

import java.util.List;
import java.util.Map;

import com.swpu.entity.CstService;

/** 
* @author  cy
* @createDate 2017年4月24日 下午9:46:38 
* @version 1.0 
* @describe  
*/
public interface CustService {
	List<CstService> selectServiceALL(Map<String,Object> param);
	
	CstService selectServiceById(Integer svr_id);
	
	void insertService(Map<String,Object> param);
	
	Integer findServiceCount();
	
	Integer findServiceCountByParam(Map<String,Object> param);
	
	void dispatch(Map<String,Object> param);
	
	void deal(Map<String,Object> param);
	
	void feedback(Map<String,Object> param);
	
	void deleteService(Integer svr_id);
}
