package com.romance.admin.terms.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.terms.termsService;
import com.romance.admin.terms.termsVO;

@Service
public class termsServiceImpl implements termsService {

	@Autowired
	termsDAO dao;
	
	@Override
	public void insertTerms(termsVO vo) {
		dao.insertTerms(vo);
	}
	
	@Override
	public List<termsVO> getTermsList(termsVO vo) {
		return dao.getTermsList(vo);
	}
	

}
