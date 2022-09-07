package com.romance.admin.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.faq.FaqSearchVO;
import com.romance.admin.faq.FaqVO;

@Repository
public class FaqDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<FaqVO> getFaqList(FaqSearchVO svo){
		return sqlSession.selectList("FaqDAO.getFaqList", svo);
	}
	
	public int getCount(FaqSearchVO svo) {
		return sqlSession.selectOne("FaqDAO.getCount", svo);
	}
}
