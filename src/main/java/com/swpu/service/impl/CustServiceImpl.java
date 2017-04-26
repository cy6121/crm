package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.CstService;
import com.swpu.mapper.CustServiceMapper;
import com.swpu.service.CustService;

/** 
* @author  cy
* @createDate 2017年4月25日 下午9:37:38 
* @version 1.0 
* @describe  
*/

@Service
public class CustServiceImpl implements CustService{

	@Autowired
	private CustServiceMapper custServiceMapper;
	
	@Override
	public List<CstService> selectServiceALL(Map<String, Object> param) {
		return custServiceMapper.selectServiceALL(param);
	}

	@Override
	public CstService selectServiceById(Integer svr_id) {
		return custServiceMapper.selectServiceById(svr_id);
	}

	@Transactional
	@Override
	public void insertService(Map<String,Object> param) {
		custServiceMapper.insertService(param);
	}

	@Override
	public Integer findServiceCount() {
		return custServiceMapper.findServiceCount();
	}

	@Override
	public Integer findServiceCountByParam(Map<String, Object> param) {
		return custServiceMapper.findServiceCountByParam(param);
	}

	@Transactional
	@Override
	public void dispatch(Map<String, Object> param) {
		custServiceMapper.dispatch(param);
	}

	@Transactional
	@Override
	public void deal(Map<String,Object> param) {
		custServiceMapper.deal(param);
	}

	@Transactional
	@Override
	public void deleteService(Integer svr_id) {
		custServiceMapper.deleteService(svr_id);
	}

	@Transactional
	@Override
	public void feedback(Map<String, Object> param) {
		custServiceMapper.feedback(param);
	}

}
