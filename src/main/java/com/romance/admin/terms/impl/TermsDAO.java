package com.romance.admin.terms.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.notice.NoticeVO;
import com.romance.admin.terms.TermsVO;

@Repository
public class TermsDAO {
	@Autowired
	SqlSessionTemplate sqlsession;
	
	public void insertTerms(TermsVO vo) {
		System.out.println("---> MyBatis로 insertTerms");
		sqlsession.insert("Terms.insertTerms", vo);
	}
	
	public List<TermsVO> getTermsList(TermsVO vo){
		System.out.println("daocate"+vo);
		return sqlsession.selectList("Terms.getTermsList",vo);
	}
	
	public void countCnt(int seq) {
		sqlsession.update("Terms.countCnt", seq);
	}
	
	public TermsVO getTerms(TermsVO vo) {
		System.out.println("---> MyBatis로 getTerms() 기능 처리");
		System.out.println((TermsVO)sqlsession.selectOne("Terms.getTerms", vo));
		return (TermsVO)sqlsession.selectOne("Terms.getTerms", vo);
	}
	
	public void alterTerms(TermsVO vo) {
		System.out.println("---> MyBatis로 alterTerms() 기능 처리");
		sqlsession.insert("Terms.alterTerms", vo);
	}
	
	public int getCount() {
		System.out.println("---> MyBatis로 getCountTerms() 기능 처리");
		return sqlsession.selectOne("Terms.getCount"); 
	}
	
	public void deleteTerms(TermsVO vo) {
		System.out.println("---> MyBatis로 deleteTerms() 기능 처리");
		sqlsession.delete("Terms.deleteTerms", vo);
	}
}

