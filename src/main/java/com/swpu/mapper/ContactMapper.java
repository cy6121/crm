package com.swpu.mapper;

import java.util.List;

import com.swpu.entity.Contact;

/** 
* @author  cy
* @createDate 2017年4月11日 下午9:04:20 
* @version 1.0 
* @describe  
*/
public interface ContactMapper {
	
	List<Contact> selectContactByCust(Integer cust_id);
	
	Contact selectContactById(Integer contact_id);
	
	void updateContact(Contact contact);
	
	void insertContact(Contact contact);
	
	void deleteContact(Integer contact_id);
}
