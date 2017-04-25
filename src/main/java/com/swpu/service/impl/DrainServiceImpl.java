package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.Drain;
import com.swpu.mapper.DrainMapper;
import com.swpu.service.DrainService;

/** 
* @author  cy
* @createDate 2017年4月24日 下午9:55:07 
* @version 1.0 
* @describe  
*/

@Service
public class DrainServiceImpl implements DrainService{

	@Autowired
	private DrainMapper drainMapper;
	
	@Override
	public List<Drain> selectDrainALL(Map<String,Object> param) {
		return drainMapper.selectDrainALL(param);
	}

	@Override
	public Drain selectDrainById(Integer drain_id) {
		return drainMapper.selectDrainById(drain_id);
	}

	@Transactional
	@Override
	public void updateDrain(Drain drain) {
		drainMapper.updateDrain(drain);
	}

	@Override
	public Integer findDrainCount() {
		return drainMapper.findDrainCount();
	}

	@Override
	public Integer findDrainCountByParam(Map<String, Object> param) {
		return drainMapper.findDrainCountByParam(param);
	}

}
