package com.romance.admin.login.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.log.LoginLogVO;
import com.romance.admin.login.AdminUserVO;

@Repository
public class AdminUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public AdminUserVO getUser(AdminUserVO vo) {
		System.out.println("Mybatis로 getUser() 기능 처리");
		return sqlSessionTemplate.selectOne("AdminUserDAO.getUser", vo);
	}
	
	public void loginDay(String user_id) {
		System.out.println("Mybatis로 loginDay() 기능 처리");
		sqlSessionTemplate.update("AdminUserDAO.loginDay", user_id);
	}
	
	public int isUserId(String login_log_id) {
		return sqlSessionTemplate.selectOne("loggingUtils.isUserId", login_log_id);
	}
	
	public AdminUserVO getLoginlogInfo(String login_log_id) {
		return sqlSessionTemplate.selectOne("loggingUtils.getAdminLoginlogInfo", login_log_id);
	}	
	
	public void insertLoginLog(LoginLogVO loginLogVO) {
		sqlSessionTemplate.insert("loggingUtils.insertLoginLog", loginLogVO);
	}
}
