package com.swpu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.Dict;
import com.swpu.mapper.DictMapper;
import com.swpu.service.DictService;

/** 
* @author  cy
* @createDate 2017年4月11日 上午11:37:56 
* @version 1.0 
* @describe  
*/
@Service
public class DictServiceImpl implements DictService{

	@Autowired
	private DictMapper dictMapper;
	
	@Transactional
	@Override
	public void insertDict(Dict dict) {
		dictMapper.insertDict(dict);
	}

	@Override
	public List<Dict> selectDictALL() {
		return dictMapper.selectDictALL();
	}

	@Transactional
	@Override
	public void deleteDict(Integer dictId) {
		dictMapper.deleteDict(dictId);
	}

	@Override
	public Dict findDictById(Integer dictId) {
		return dictMapper.findDictById(dictId);
	}

	@Transactional
	@Override
	public void updateDict(Dict dict) {
		dictMapper.updateDict(dict);
	}

}
