package com.swpu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swpu.entity.Order;
import com.swpu.entity.OrderItem;
import com.swpu.mapper.OrderMapper;
import com.swpu.service.OrderService;

/** 
* @author  cy
* @createDate 2017年4月23日 下午5:10:36 
* @version 1.0 
* @describe  
*/

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public List<Order> selectOrderByCust(Integer cust_id) {
		return orderMapper.selectOrderByCust(cust_id);
	}

	@Override
	public Order selectOrderById(Integer odr_id) {
		List<OrderItem> items = orderMapper.selectOrderItemById(odr_id);
		Order order = orderMapper.selectOrderById(odr_id);
		order.setItems(items);
		return order;
	}

}
