package com.romance.user.terms.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.terms.TermsVO;

@Repository
public class PaymentTermsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public List<TermsVO> getPaymentTerms() {
		System.out.println("---> MyBatis로 getPaymentTerms() 기능 처리");
		return sqlsession.selectList("paymentTerms.getPaymentTerms");
	}
	
}
