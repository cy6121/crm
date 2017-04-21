package com.swpu.mapper;

import java.util.List;
import java.util.Map;

import com.swpu.entity.Contact;

/** 
* @author  cy
* @createDate 2017年4月11日 下午9:04:20 
* @version 1.0 
* @describe  
*/
public interface ContactMapper {
	
	List<Contact> selectContactById(Integer sale_id);
	
	void updateContact(Map<String,Object> param);
	
	void insertContact(Contact Contact);
	
	void deletePlan(Integer plan_id);
}
