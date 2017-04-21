package com.swpu.mapper;

import java.util.List;
import java.util.Map;

import com.swpu.entity.Storage;

/**
 * @author cy
 * @createDate 2017年4月11日 下午10:08:25
 * @version 1.0
 * @describe
 */
public interface StorageMapper {
	void insertStorage(Storage storage);

	void deleteStorage(Integer stkId);

	List<Storage> selectStorageALL(Map<String,Object> param);

	Storage findStorageById(Integer stkId);
	
	void updateStorage(Storage storage);
	
	Integer findStorageCount();
	
	Integer findStorageCountByParam(Map<String,Object> param);
}
