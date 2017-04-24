package com.swpu.service;

import java.util.List;

import com.swpu.entity.Order;

/** 
* @author  cy
* @createDate 2017年4月23日 下午5:09:21 
* @version 1.0 
* @describe  
*/
public interface OrderService {
	List<Order> selectOrderByCust(Integer cust_id);
	
	Order selectOrderById(Integer odr_id);
}
