package com.swpu.mapper;

import java.util.List;

import com.swpu.entity.Order;
import com.swpu.entity.OrderItem;

/** 
* @author  cy
* @createDate 2017年4月23日 下午5:09:21 
* @version 1.0 
* @describe  
*/
public interface OrderMapper {
	List<Order> selectOrderByCust(Integer cust_id);
	
	Order selectOrderById(Integer odr_id);
	
	List<OrderItem> selectOrderItemById(Integer order_id);
}
