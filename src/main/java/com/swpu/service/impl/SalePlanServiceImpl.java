package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.SalePlan;
import com.swpu.mapper.SalePlanMapper;
import com.swpu.service.SalePlanService;

/** 
* @author  cy
* @createDate 2017年4月19日 下午7:18:41 
* @version 1.0 
* @describe  
*/

@Service
public class SalePlanServiceImpl implements SalePlanService{

	@Autowired
	private SalePlanMapper salePlanMapper;
	
	@Override
	public List<SalePlan> selectSalePlanById(Integer sale_id) {
		return salePlanMapper.selectSalePlanById(sale_id);
	}

	@Transactional
	@Override
	public void updateSalePlan(Map<String,Object> param) {
		salePlanMapper.updateSalePlan(param);
	}

	@Transactional
	@Override
	public void insertSalePlan(SalePlan salePlan) {
		salePlanMapper.insertSalePlan(salePlan);
	}

	@Transactional
	@Override
	public void deletePlan(Integer plan_id) {
		salePlanMapper.deletePlan(plan_id);
	}

}
