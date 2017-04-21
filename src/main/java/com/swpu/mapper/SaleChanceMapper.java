package com.swpu.mapper;

import java.util.List;
import java.util.Map;

import com.swpu.entity.SaleChance;

/** 
* @author  cy
* @createDate 2017年4月18日 下午10:23:41 
* @version 1.0 
* @describe  
*/
public interface SaleChanceMapper {
	void insertSaleChance(SaleChance saleChance);
	
	void deleteSaleChance(Integer sale_id);
	
	List<SaleChance> selectSaleChanceALL(Map<String,Object> param);
	
	SaleChance findSaleChanceById(Integer sale_id);
	
	void updateSaleChance(SaleChance saleChance);
	
	Integer findSaleChanceCount(Map<String,Object> param);
	
	Integer findSaleChanceCountByParam(Map<String,Object> param);
	
	void dispatch(Map<String,Object> param);
	
	void updateSaleChanceState(SaleChance saleChance);
}
