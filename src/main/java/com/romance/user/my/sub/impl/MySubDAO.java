package com.romance.user.my.sub.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.login.UserVO;

@Repository
public class MySubDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<String> getcate(UserVO vo) {
		return sqlSessionTemplate.selectList("SubscribeDAO.getcate",vo);
	}
	
}
