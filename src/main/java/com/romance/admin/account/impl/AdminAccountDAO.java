package com.romance.admin.account.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.login.AdminUserVO;

@Repository
public class AdminAccountDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminUserVO> getUserList(AdminUserVO vo) {
		System.out.println("Mybatis로 getUserList 기능 처리");
		return sqlSessionTemplate.selectList("AdminUserDAO.getUserList", vo);
	}

		
	
	
}
