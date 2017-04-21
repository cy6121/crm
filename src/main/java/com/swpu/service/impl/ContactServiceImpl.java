package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.Contact;
import com.swpu.mapper.ContactMapper;
import com.swpu.service.ContactService;

/** 
* @author  cy
* @createDate 2017年4月21日 上午10:54:37 
* @version 1.0 
* @describe  
*/
@Service
public class ContactServiceImpl implements ContactService{

	@Autowired
	private ContactMapper contactMapper;
	
	@Override
	public List<Contact> selectContactById(Integer sale_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateContact(Map<String, Object> param) {
		// TODO Auto-generated method stub
		
	}

	@Transactional
	@Override
	public void insertContact(Contact Contact) {
		contactMapper.insertContact(Contact);
	}

	@Override
	public void deletePlan(Integer plan_id) {
		// TODO Auto-generated method stub
		
	}

}
