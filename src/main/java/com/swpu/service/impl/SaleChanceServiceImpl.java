package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.SaleChance;
import com.swpu.mapper.SaleChanceMapper;
import com.swpu.service.SaleChanceService;

/** 
* @author  cy
* @createDate 2017年4月18日 下午10:28:56 
* @version 1.0 
* @describe  
*/

@Service
public class SaleChanceServiceImpl implements SaleChanceService{

	@Autowired
	private SaleChanceMapper saleChanceMapper;
	
	@Transactional
	@Override
	public void insertSaleChance(SaleChance saleChance) {
		saleChanceMapper.insertSaleChance(saleChance);
	}

	@Transactional
	@Override
	public void deleteSaleChance(Integer sale_id) {
		saleChanceMapper.deleteSaleChance(sale_id);
	}

	@Override
	public List<SaleChance> selectSaleChanceALL(Map<String, Object> param) {
		return saleChanceMapper.selectSaleChanceALL(param);
	}

	@Override
	public SaleChance findSaleChanceById(Integer sale_id) {
		return saleChanceMapper.findSaleChanceById(sale_id);
	}

	@Transactional
	@Override
	public void updateSaleChance(SaleChance saleChance) {
		saleChanceMapper.updateSaleChance(saleChance);
	}

	@Override
	public Integer findSaleChanceCount(Map<String,Object> param) {
		return saleChanceMapper.findSaleChanceCount(param);
	}

	@Override
	public Integer findSaleChanceCountByParam(Map<String, Object> param) {
		return saleChanceMapper.findSaleChanceCountByParam(param);
	}

	@Transactional
	@Override
	public void dispatch(Map<String, Object> param) {
		saleChanceMapper.dispatch(param);
	}

	@Transactional
	@Override
	public void updateSaleChanceState(SaleChance saleChance) {
		saleChanceMapper.updateSaleChanceState(saleChance);
	}

}
