package com.swpu.mapper;

import java.util.List;

import com.swpu.entity.Dict;

/** 
* @author  cy
* @createDate 2017年4月11日 上午11:34:36 
* @version 1.0 
* @describe  
*/
public interface DictMapper {
	/**插入一条基础数据
	 * @param dict
	 */
	void insertDict(Dict dict);
	
	void deleteDict(Integer dictId);
	
	/**获取所有基础数据
	 * @return
	 */
	List<Dict> selectDictALL();
	
	Dict findDictById(Integer dictId);
	
	void updateDict(Dict dict);
}
