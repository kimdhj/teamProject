package com.romance.admin.login.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.login.AdminUserVO;

@Repository
public class AdminUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public AdminUserVO getUser(AdminUserVO vo) {
		System.out.println("Mybatis로 getUser() 기능 처리");
		return sqlSessionTemplate.selectOne("AdminUserDAO.getUser", vo);
	}
	
}
