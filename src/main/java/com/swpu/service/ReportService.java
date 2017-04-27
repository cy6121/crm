package com.swpu.service;

import java.util.List;
import java.util.Map;

/** 
* @author  cy
* @createDate 2017年4月26日 下午7:17:33 
* @version 1.0 
* @describe  
*/
public interface ReportService {
	List<Map<String,Object>> selectConsistByType(Map<String,Object> param);
	
	List<Map<String,Object>> selectPayByParam(Map<String,Object> param);
	
	List<Map<String,Object>> selectServiceByParam(Map<String,Object> param);
	
	Integer selectPayCount();
	
	Integer selectPayCountByParam(Map<String,Object> param);
}
