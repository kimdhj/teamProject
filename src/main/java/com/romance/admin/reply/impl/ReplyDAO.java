package com.romance.admin.reply.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.reply.ReplyJoinVO;
import com.romance.admin.reply.ReplySearchVO;
import com.romance.admin.reply.ReplyVO;
import com.romance.user.book.BookVO;
import com.romance.user.orders.OrderBookListVO;

import edu.emory.mathcs.backport.java.util.AbstractSequentialList;

@Repository
public class ReplyDAO {
  @Autowired
  private SqlSessionTemplate sqlSession;
  
  public List<ReplyJoinVO> getReplyList(ReplySearchVO svo){
    return sqlSession.selectList("ReplyDAO.getReplyList", svo);
  }
  
  public int getCount(ReplySearchVO svo) {
    return sqlSession.selectOne("ReplyDAO.getCount" , svo);
  }
  
  public ReplyVO getReply(ReplyVO rjvo) {
    return sqlSession.selectOne("ReplyDAO.getReply", rjvo);
  }
  
  
  public void delete(ReplyVO vo) {
    sqlSession.delete("ReplyDAO.delete", vo);
  }
  
  public void chkboxDelete(int reply_seq) {
    sqlSession.delete("ReplyDAO.chkboxDelete", reply_seq);
  }
  
  public void blind(ReplyVO vo) {
    sqlSession.update("ReplyDAO.blind", vo);
  }
  
  public void blindCancel(ReplyVO vo) {
    System.out.println("DAO 블라인드 해체 " + vo);
    sqlSession.update("ReplyDAO.blindCancel", vo);
  }
  
  public void chkboxBlind(int reply_seq) {
    sqlSession.update("ReplyDAO.chkboxBlind", reply_seq);
  }
  
  public void chkboxBlindCancel(int reply_seq) {
    sqlSession.update("ReplyDAO.chkboxBlindCancel", reply_seq);
  }
  
  public void insert(ReplyVO vo) {
    sqlSession.insert("ReplyDAO.insert", vo);
  }
  
  public BookVO getBookInfo(BookVO vo) {
    return sqlSession.selectOne("ReplyDAO.getBookInfo", vo);
  }
  
  public void reviewStateUpdate(OrderBookListVO blvo) {
    sqlSession.update("ReplyDAO.reviewStateUpdate", blvo);
  }
  
  public void reviewUpdate(ReplyVO vo) {
    sqlSession.update("ReplyDAO.reviewUpdate", vo);
  }
  
  public ReplyVO doubleReply(ReplyJoinVO rjvo) {
   return sqlSession.selectOne("ReplyDAO.doubleReply", rjvo);
  }
  
}
