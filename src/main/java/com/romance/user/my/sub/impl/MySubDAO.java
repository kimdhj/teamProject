package com.romance.user.my.sub.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MySubDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
