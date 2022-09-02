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
}
