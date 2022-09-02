package com.romance.admin.terms.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.romance.admin.terms.termsService;
import com.romance.admin.terms.termsVO;

public class termsServiceImpl implements termsService {

	@Autowired
	termsDAO dao;
	
	@Override
	public List<termsVO> getTermsList(termsVO vo) {
		return dao.getTermsList(vo);
	}

}
