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
	
	List<Customer> selectCustomerById(Integer sale_id);
	
	void updateCustomer(Map<String,Object> param);
	
	void insertCustomer(Customer Customer);
	
	void deletePlan(Integer plan_id);
}
