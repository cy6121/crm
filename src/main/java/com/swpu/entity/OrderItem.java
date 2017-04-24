package com.swpu.entity;

import java.math.BigDecimal;

/** 
* @author  cy
* @createDate 2017年4月23日 下午7:24:42 
* @version 1.0 
* @describe  
*/
public class OrderItem {
	private Integer odd_id;
	private Integer order_id;
	private Product product;
	private Integer count;
	private BigDecimal price;
	public Integer getOdd_id() {
		return odd_id;
	}
	public void setOdd_id(Integer odd_id) {
		this.odd_id = odd_id;
	}
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
}
