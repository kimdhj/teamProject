package com.romance.user.my.profile.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.login.UserVO;

@Repository
public class MyProfileDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public UserVO getSessionUser(String user_id) {
		return sqlSessionTemplate.selectOne("userProfile.getSessionUser", user_id);
	}
	
	public void userWithdrawal(String user_id) {
		sqlSessionTemplate.update("userProfile.userWithdrawal", user_id);
	}
	
	public void transPassword(UserVO userVO) {
		sqlSessionTemplate.update("userProfile.transPassword", userVO);
	}
	
}
