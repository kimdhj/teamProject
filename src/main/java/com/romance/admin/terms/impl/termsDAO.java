package com.romance.admin.terms.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.terms.termsVO;

@Repository
public class termsDAO {
	@Autowired
	SqlSessionTemplate sqlsession;
	
	public void insertTerms(termsVO vo) {
		System.out.println("---> MyBatis로 insertTerms");
		sqlsession.insert("Terms.insertTerms", vo);
	}
	
	public List<termsVO> getTermsList(termsVO vo){
		System.out.println("daocate"+vo);
		return sqlsession.selectList("Terms.getTermsList",vo);
	}
	
	public void countCnt(int seq) {
		sqlsession.update("Terms.countCnt", seq);
	}
	
	public termsVO getTerms(termsVO vo) {
		System.out.println("---> MyBatis로 getTerms() 기능 처리");
		System.out.println((termsVO)sqlsession.selectOne("Terms.getTerms", vo));
		return (termsVO)sqlsession.selectOne("Terms.getTerms", vo);
	}
	
	public void alterTerms(termsVO vo) {
		System.out.println("---> MyBatis로 alterTerms() 기능 처리");
		sqlsession.insert("Terms.alterTerms", vo);
	}
}
