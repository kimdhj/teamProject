package com.romance.user.my.request.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.login.UserVO;
import com.romance.user.my.request.MyRequestVO;

@Repository
public class MyRequestDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserVO getUser(String session_user_id) {
		System.out.println("Mybatis로 세션에 저장된 user정보 가져오기");
		System.out.println(">>>DAO session_user_id값 : " + session_user_id);
		return sqlSessionTemplate.selectOne("userRequest.getUserToken", session_user_id);
	}
	
	public List<MyRequestVO> getRequestList(String session_user_id) {
		return sqlSessionTemplate.selectList("userRequest.getRequestList", session_user_id);
	}
}
