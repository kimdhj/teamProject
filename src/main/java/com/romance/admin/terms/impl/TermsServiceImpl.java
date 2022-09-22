package com.romance.admin.terms.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.terms.TermsSearchVO;
import com.romance.admin.terms.TermsService;
import com.romance.admin.terms.TermsVO;

@Service
public class TermsServiceImpl implements TermsService {

	@Autowired
	TermsDAO dao;
	
	@Override
	public void insertTerms(TermsVO vo) {
		dao.insertTerms(vo);
	}
	
	@Override
	public int getCount(TermsSearchVO svo) {
		return dao.getCount(svo);
	}

	@Override
	public List<TermsVO> getTermsList(TermsSearchVO svo) {
		return dao.getTermsList(svo);
	}

	@Override
	public void deleteTerms(TermsVO vo) {
		dao.deleteTerms(vo);
	}
		

	@Override
	public void countCnt(int seq) {
		dao.countCnt(seq);
	}

	@Override
	public TermsVO getTerms(TermsVO vo) {
		return dao.getTerms(vo);
	}

	@Override
	public void alterTerms(TermsVO vo) {
		dao.alterTerms(vo);
		
	}
	

}
