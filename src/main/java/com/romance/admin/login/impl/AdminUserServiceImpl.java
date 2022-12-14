package com.romance.admin.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.log.LoginLogVO;
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

	@Override
	public void loginDay(String user_id) {
		adminUserDAO.loginDay(user_id);		
	}

	@Override
	public int isUserId(String login_log_id) {
		return adminUserDAO.isUserId(login_log_id);
	}
	
	@Override
	public AdminUserVO getLoginlogInfo(String login_log_id) {
		return adminUserDAO.getLoginlogInfo(login_log_id);
	}

	@Override
	public void insertLoginLog(LoginLogVO loginLogVO) {
		adminUserDAO.insertLoginLog(loginLogVO);
	}

	
}
