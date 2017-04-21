package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.Storage;
import com.swpu.mapper.StorageMapper;
import com.swpu.service.StorageService;

/** 
* @author  cy
* @createDate 2017年4月11日 下午10:10:08 
* @version 1.0 
* @describe  
*/
@Service
public class StorageServiceImpl implements StorageService{

	@Autowired
	private StorageMapper storageMapper;
	
	@Transactional
	@Override
	public void insertStorage(Storage storage) {
		storageMapper.insertStorage(storage);
	}

	@Transactional
	@Override
	public void deleteStorage(Integer stkId) {
		storageMapper.deleteStorage(stkId);
	}

	@Override
	public List<Storage> selectStorageALL(Map<String,Object> param) {
		return storageMapper.selectStorageALL(param);
	}

	@Override
	public Storage findStorageById(Integer stkId) {
		return storageMapper.findStorageById(stkId);
	}

	@Transactional
	@Override
	public void updateStorage(Storage storage) {
		storageMapper.updateStorage(storage);
	}

	@Override
	public Integer findStorageCount() {
		return storageMapper.findStorageCount();
	}

	@Override
	public Integer findStorageCountByParam(Map<String, Object> param) {
		return storageMapper.findStorageCountByParam(param);
	}

}
