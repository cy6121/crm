package com.swpu.service;

import java.util.List;
import java.util.Map;

import com.swpu.entity.Contact;
import com.swpu.entity.Customer;
import com.swpu.entity.SaleChance;

/** 
* @author  cy
* @createDate 2017年4月11日 下午9:04:20 
* @version 1.0 
* @describe  
*/
public interface CustomerService {
	
	List<Customer> selectCustomerALL(Map<String,Object> param);
	
	Customer selectCustomerById(Integer cust_id);
	
	Customer selectCustomerByName(String name);
	
	void updateCustomer(Customer customer);
	
	void CustomerLostWarning();
	
	void insertCustomer(SaleChance saleChance,Customer customer,Contact contact);
	
	Integer findCustomerCount();
	
	Integer findCustomerCountByParam(Map<String,Object> param);
}
