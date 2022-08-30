package com.romance.admin.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.login.AdminUserService;
import com.romance.admin.login.AdminUserVO;

@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired
	private AdminUserDAO adminUserDAO;
	
	public void setAdminUserDAO(AdminUserDAO adminUserDAO) {
		this.adminUserDAO = adminUserDAO;
	}
	
	@Override
	public AdminUserVO getUser(AdminUserVO vo) {
		
		return adminUserDAO.getUser(vo);
	}
	
}
