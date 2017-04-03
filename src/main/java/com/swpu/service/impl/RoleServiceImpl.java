package com.swpu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.swpu.entity.Role;
import com.swpu.mapper.RoleMapper;
import com.swpu.service.RoleService;

/** 
* @author  cy
* @createDate 2017年3月26日 下午4:30:00 
* @version 1.0 
* @describe  
*/

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public List<Role> findByUserId(Integer userId) {
		return roleMapper.findByUserId(userId);
	}

	@Override
	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}

	@Transactional
	@Override
	public void save(Role role) {
		roleMapper.save(role);
	}

	@Override
	public Role selectOne(Integer roleid) {
		return roleMapper.selectOne(roleid);
	}

	@Transactional
	@Override
	public void updateRole(Role role) {
		roleMapper.updateRole(role);
	}

	@Transactional
	@Override
	public void deleteRole(Integer roleid) {
		roleMapper.deleteRole(roleid);
		roleMapper.deleteUserRole(roleid);
		roleMapper.deleteRolePermission(roleid,null);
	}

	@Transactional
	@Override
	public void addRoleAuth(Integer roleid, String[] menuid,String type) {
		roleMapper.deleteRolePermission(roleid,type);
		if (menuid.length != 0) {
			roleMapper.addRoleAuth(roleid,menuid);
		}
	}

}
