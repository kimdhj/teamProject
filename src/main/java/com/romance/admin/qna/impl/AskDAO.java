package com.romance.admin.qna.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.qna.AskReplyVO;
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
	
	public AskVO getAsk(AskVO vo) {
		return sqlSession.selectOne("AskDAO.getAsk", vo);
	}
	
	public AskReplyVO getAskReply(AskReplyVO arvo) {
		return sqlSession.selectOne("AskDAO.getAskReply", arvo);
	}
	
	public void delete(AskVO vo) {
		sqlSession.delete("AskDAO.delete1", vo);
	}
	
	public void delete(AskReplyVO arvo) {
	  sqlSession.delete("AskDAO.delete2", arvo);
	}
	
	public void chkboxDelete1(int ask_seq) {
		sqlSession.delete("AskDAO.chkboxDelete1", ask_seq);
	}
	
	public void chkboxDelete2(int ask_seq) {
	  sqlSession.delete("AskDAO.chkboxDelete2", ask_seq);
	}
	
	public boolean checkPW(AskReplyVO arvo) {
	  boolean result = false;
	  
	  int count = sqlSession.selectOne("AskDAO.checkPW", arvo);
	  
	  if(count == 1)
	    result = true;
	  return result;
	}
	
	public void answerInsert(AskReplyVO arvo) {
	  sqlSession.insert("AskDAO.answerInsert", arvo);
	}
	
	public void answerStatus(AskVO vo) {
	  sqlSession.update("AskDAO.answerStatus", vo);
	}
	
	public void changeStatus(AskVO vo) {
	  sqlSession.update("AskDAO.changeStatus", vo);
	}
	
	public void update(AskReplyVO arvo) {
	  sqlSession.update("AskDAO.update", arvo);
	}
	
}
