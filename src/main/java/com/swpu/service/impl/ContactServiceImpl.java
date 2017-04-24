package com.swpu.service.impl;

import java.util.List;

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
	
	@Transactional
	@Override
	public void updateContact(Contact contact) {
		contactMapper.updateContact(contact);
	}

	@Transactional
	@Override
	public void insertContact(Contact contact) {
		contactMapper.insertContact(contact);
	}

	@Override
	public List<Contact> selectContactByCust(Integer cust_id) {
		return contactMapper.selectContactByCust(cust_id);
	}

	@Override
	public Contact selectContactById(Integer contact_id) {
		return contactMapper.selectContactById(contact_id);
	}

	@Transactional
	@Override
	public void deleteContact(Integer contact_id) {
		contactMapper.deleteContact(contact_id);
	}


}
