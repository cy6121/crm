package com.swpu.mapper;

import java.util.List;
import java.util.Map;

import com.swpu.entity.Customer;

/** 
* @author  cy
* @createDate 2017年4月11日 下午9:04:20 
* @version 1.0 
* @describe  
*/
public interface CustomerMapper {
	
	List<Customer> selectCustomerALL(Map<String,Object> param);
	
	Customer selectCustomerById(Integer cust_id);
	
	Customer selectCustomerByName(String name);
	
	void updateCustomer(Customer customer);
	
	void CustomerLostWarning();
	
	void insertCustomer(Customer customer);
	
	Integer findCustomerCount();
	
	Integer findCustomerCountByParam(Map<String,Object> param);
}
