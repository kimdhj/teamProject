package com.romance.admin.terms;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddTermsDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<termsVO> getJoin_terms() {
		System.out.println("---> MyBatis로 getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("AddTerms.getJoin_terms");
	}
	
}
