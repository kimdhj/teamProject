package com.romance.admin.log.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.log.Criteria;
import com.romance.admin.log.LoginLogVO;
import com.romance.admin.log.PaymentLogVO;
import com.romance.admin.log.WorkLogVO;

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
	
	public int getWorkTotalCount() {
		return sqlSessionTemplate.selectOne("loggingUtils.getWorkTotalCount");
	}
	
	public List<WorkLogVO> getWorkLogList(Criteria criteria) {
		return sqlSessionTemplate.selectList("loggingUtils.getWorkLogList", criteria);
	}
	
	public int getPaymentTotalCount() {
		return sqlSessionTemplate.selectOne("loggingUtils.getPaymentTotalCount");
	}
	
	public List<PaymentLogVO> getPaymentLogList(Criteria criteria) {
		return sqlSessionTemplate.selectList("loggingUtils.getPaymentLogList", criteria);
	}
	
}
