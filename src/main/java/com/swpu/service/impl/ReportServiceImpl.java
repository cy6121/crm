package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swpu.mapper.ReportMapper;
import com.swpu.service.ReportService;

/** 
* @author  cy
* @createDate 2017年4月26日 下午7:19:26 
* @version 1.0 
* @describe  
*/

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportMapper reportMapper;
	
	@Override
	public List<Map<String,Object>> selectConsistByType(Map<String, Object> param) {
		return reportMapper.selectConsistByType(param);
	}

	@Override
	public List<Map<String, Object>> selectPayByParam(Map<String, Object> param) {
		return reportMapper.selectPayByParam(param);
	}

	@Override
	public Integer selectPayCount() {
		return reportMapper.selectPayCount();
	}

	@Override
	public Integer selectPayCountByParam(Map<String, Object> param) {
		return reportMapper.selectPayCountByParam(param);
	}

	@Override
	public List<Map<String, Object>> selectServiceByParam(Map<String, Object> param) {
		return reportMapper.selectServiceByParam(param);
	}

}
