package com.swpu.service;

import java.util.List;

import com.swpu.entity.Dict;

/** 
* @author  cy
* @createDate 2017年4月11日 上午11:36:31 
* @version 1.0 
* @describe  
*/
public interface DictService {
	void insertDict(Dict dict);
	
	void deleteDict(Integer dictId);
	
	List<Dict> selectDictALL();
	
	Dict findDictById(Integer dictId);
	
	void updateDict(Dict dict);
}
