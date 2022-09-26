package com.romance.user.terms.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.terms.TermsVO;
import com.romance.user.terms.PaymentTermsService;

@Service
public class PaymentTermsServiceImpl implements PaymentTermsService {

	@Autowired
	private PaymentTermsDAO dao;
	
	@Override
	public List<TermsVO> getPaymentTerms() {
		return dao.getPaymentTerms();
	}

	
}
