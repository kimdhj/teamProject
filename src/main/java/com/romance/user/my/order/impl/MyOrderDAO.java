package com.romance.user.my.order.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyOrderDAO {

	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
}
