package com.swpu.controller.dict;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.Product;
import com.swpu.service.ProductService;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/dict/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String data() {
		
		return "dict/product/list";
	}
	
	@RequestMapping(value = "datas.json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> dataList(HttpServletRequest request){
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		//当前所在页，第一页为0
        Integer currentPage = Integer.valueOf(request.getParameter("start"));
        //页面最大显示记录数
        Integer pageNum = Integer.valueOf(request.getParameter("length"));
        String searchValue = request.getParameter("search[value]").trim();
		
        if (StringUtils.isNotEmpty(searchValue)) {
			searchValue = "%" + searchValue + "%";
		}
        
        Map<String,Object> param = Maps.newHashMap();
		param.put("searchValue",searchValue);
		param.put("currentPage",currentPage);
		param.put("pageNum",pageNum);
        
		Map<String,Object> map = Maps.newHashMap();
		List<Product> datas = productService.selectProductALL(param);
		Integer count = productService.findProductCount();
		Integer recordsFiltered = productService.findProductCountByParam(param);
		map.put("data",datas);
		map.put("draw",draw);
		map.put("recordsTotal",count);//总记录数
		map.put("recordsFiltered",recordsFiltered);
		return map;
	}
	
	@RequestMapping(value = "data.json",method = RequestMethod.GET)
	@ResponseBody
	public Product dataOne(Integer prodId){
		return productService.findProductById(prodId);
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	@ResponseBody
	public String add(Product product){
		productService.insertProduct(product);
		return "success";
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	@ResponseBody
	public String edit(Product product){
		productService.updateProduct(product);
		return "success";
	}
	
	@RequestMapping(value = "del",method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer prodId){
		productService.deleteProduct(prodId);
		return "success";
	}
	
}
