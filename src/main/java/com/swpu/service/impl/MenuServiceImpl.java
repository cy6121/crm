package com.swpu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swpu.entity.Menu;
import com.swpu.mapper.MenuMapper;
import com.swpu.service.MenuService;

/** 
* @author  cy
* @createDate 2017年2月18日 下午4:59:26 
* @version 1.0 
* @describe  
*/

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public List<Menu> getMenu(Map<String,Object> params) {
		return menuMapper.getAuthByRole(params);
	}

	@Override
	public List<Menu> getALLMenu(Map<String,Object> params) {
		return menuMapper.getALLAuth(params);
	}

}
