package com.romance.admin.terms;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddTermsDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<TermsVO> getJoin_terms() {
		System.out.println("---> MyBatis로 getJoin_terms() 기능 처리");
		return sqlSessionTemplate.selectList("AddTerms.getJoin_terms");
	}
	
	public List<TermsVO> getSub_terms() {
		System.out.println("---> MyBatis로 getSub_terms() 기능 처리");
		return sqlSessionTemplate.selectList("AddTerms.getSub_terms");
	}
	
	public List<TermsVO> getPersonal_terms(){
		System.out.println("---> MyBatis로 getPersonal_terms() 기능 처리");
		return sqlSessionTemplate.selectList("AddTerms.getPersonal_terms");
	}
	
}
