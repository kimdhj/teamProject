package com.romance.admin.terms.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.romance.admin.terms.termsVO;

public class termsDAO {
	@Autowired
	SqlSessionTemplate sqlsession;
	
	public List<termsVO> getTermsList(termsVO vo){
		System.out.println("daocate"+vo);
		return sqlsession.selectList("Terms.getTermsList",vo);
		
	}
}
