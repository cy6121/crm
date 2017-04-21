package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.Contact;
import com.swpu.entity.Customer;
import com.swpu.entity.SaleChance;
import com.swpu.mapper.ContactMapper;
import com.swpu.mapper.CustomerMapper;
import com.swpu.mapper.SaleChanceMapper;
import com.swpu.service.CustomerService;

/** 
* @author  cy
* @createDate 2017年4月21日 上午10:25:47 
* @version 1.0 
* @describe  
*/
@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private ContactMapper contactMapper;
	
	@Autowired 
	private SaleChanceMapper saleChanceMapper;
	
	@Override
	public List<Customer> selectCustomerById(Integer sale_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCustomer(Map<String, Object> param) {
		// TODO Auto-generated method stub
		
	}

	@Transactional
	@Override
	public void insertCustomer(SaleChance saleChance,Customer customer,Contact contact) {
		saleChanceMapper.updateSaleChanceState(saleChance);
		customerMapper.insertCustomer(customer);
		contact.setCust_id(customer.getCust_id());
		contactMapper.insertContact(contact);
	}

	@Override
	public void deletePlan(Integer plan_id) {
		// TODO Auto-generated method stub
		
	}

}
