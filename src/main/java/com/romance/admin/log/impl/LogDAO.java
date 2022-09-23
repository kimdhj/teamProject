package com.romance.admin.log.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LogDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
