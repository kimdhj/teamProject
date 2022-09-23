package com.romance.admin.log.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.log.PaymentLogVO;
import com.romance.admin.log.WorkLogVO;

@Repository
public class LoggingDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void insertWorkLog(WorkLogVO workLogVO) {
		sqlSessionTemplate.insert("loggingUtils.insertWorkLog", workLogVO);
	}
	
	public void insertPaymentLog(PaymentLogVO paymentLogVO) {
		sqlSessionTemplate.insert("loggingUtils.insertPaymentLog", paymentLogVO);
	}
}
