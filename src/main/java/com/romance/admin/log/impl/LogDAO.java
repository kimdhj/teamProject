package com.romance.admin.log.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.log.Criteria;
import com.romance.admin.log.LoginLogVO;

@Repository
public class LogDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getLoginTotalCount() {
		return sqlSessionTemplate.selectOne("loggingUtils.getLoginTotalCount");
	}
	
	public List<LoginLogVO> getLoginLogList(Criteria criteria) {
		return sqlSessionTemplate.selectList("loggingUtils.getLoginLogList", criteria);
	}
	
}
