package com.romance.admin.qna.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.qna.AskSearchVO;
import com.romance.admin.qna.AskVO;

@Repository
public class AskDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AskVO> getAskList(AskSearchVO svo){
		return sqlSession.selectList("AskDAO.getAskList", svo);
	}
	
	public int getCount(AskSearchVO svo) {
		return sqlSession.selectOne("AskDAO.getCount", svo);
	}
	
	public void delete(AskVO vo) {
		sqlSession.delete("AskDAO.delete", vo);
	}
	
	public void chkboxDelete(int ask_seq) {
		sqlSession.delete("AskDAO.chkboxDelete", ask_seq);
	}
}
