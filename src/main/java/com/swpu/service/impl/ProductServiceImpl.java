package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.Product;
import com.swpu.mapper.ProductMapper;
import com.swpu.service.ProductService;

/** 
* @author  cy
* @createDate 2017年4月11日 下午9:34:06 
* @version 1.0 
* @describe  
*/
@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper productMapper;
	
	@Transactional
	@Override
	public void insertProduct(Product product) {
		productMapper.insertProduct(product);
	}

	@Transactional
	@Override
	public void deleteProduct(Integer prodId) {
		productMapper.deleteProduct(prodId);
	}

	@Override
	public List<Product> selectProductALL(Map<String,Object> param) {
		return productMapper.selectProductALL(param);
	}

	@Override
	public Product findProductById(Integer prodId) {
		return productMapper.findProductById(prodId);
	}

	@Transactional
	@Override
	public void updateProduct(Product product) {
		productMapper.updateProduct(product);
	}

	@Override
	public Integer findProductCount() {
		return productMapper.findProductCount();
	}

	@Override
	public Integer findProductCountByParam(Map<String,Object> param) {
		return productMapper.findProductCountByParam(param);
	}

	@Override
	public Product findProductByName(String name) {
		return productMapper.findProductByName(name);
	}

}
