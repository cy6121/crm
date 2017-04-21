package com.swpu.mapper;

import java.util.List;
import java.util.Map;

import com.swpu.entity.Product;

/** 
* @author  cy
* @createDate 2017年4月11日 下午9:04:20 
* @version 1.0 
* @describe  
*/
public interface ProductMapper {
	void insertProduct(Product product);
	
	void deleteProduct(Integer prodId);
	
	List<Product> selectProductALL(Map<String,Object> param);
	
	Product findProductById(Integer prodId);
	
	Product findProductByName(String name);
	
	void updateProduct(Product product);
	
	Integer findProductCount();
	
	Integer findProductCountByParam(Map<String,Object> param);
}
