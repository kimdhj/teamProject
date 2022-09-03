package com.romance.admin.sub.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.sub.SubscribeVO;


@Repository
public class SubscribeDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SubscribeVO getSub(SubscribeVO vo) {
		System.out.println("---> MyBatis로 getEvent() 기능 처리");
		return (SubscribeVO) sqlSessionTemplate.selectOne("SubscribeDAO.getSub", vo);
	}
	
}
