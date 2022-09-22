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
	
	public List<FaqVO> getOrderList(FaqSearchVO svo){
	  return sqlSession.selectList("FaqDAO.getOrderList", svo);
	}
	
	public int getCount(FaqSearchVO svo) {
		return sqlSession.selectOne("FaqDAO.getCount", svo);
	}
	
//	public int getOrderCount(FaqSearchVO svo) {
//	  return sqlSession.selectOne("FaqDAO.getOrderCount", svo);
//	}
//
//  public List<FaqVO> getDeliveryList(FaqSearchVO svo){
//    return sqlSession.selectList("FaqDAO.getDeliveryList", svo);
//  }
//  
//  public int getDeliveryCount(FaqSearchVO svo) {
//    return sqlSession.selectOne("FaqDAO.getDeliveryCount", svo);
//  }	
//	
//  public List<FaqVO> getChangeList(FaqSearchVO svo){
//    return sqlSession.selectList("FaqDAO.getChangeList", svo);
//  }
//  
//  public int getChangeCount(FaqSearchVO svo) {
//    return sqlSession.selectOne("FaqDAO.getChangeCount", svo);
//  }	
//	
//  public List<FaqVO> getUserList(FaqSearchVO svo){
//    return sqlSession.selectList("FaqDAO.getUserList", svo);
//  }
//  
//  public int getUserCount(FaqSearchVO svo) {
//    return sqlSession.selectOne("FaqDAO.getUserCount", svo);
//  }	
  
	public void chkboxDelete(int FAQ_seq) {
		sqlSession.delete("FaqDAO.chkboxDelete", FAQ_seq);
	}
	
	public FaqVO getFaq(FaqVO vo) {
		return sqlSession.selectOne("FaqDAO.getFaq", vo);
	}
	
	public void delete(FaqVO vo) {
		sqlSession.delete("FaqDAO.delete", vo);
	}
	
	public void insert(FaqVO vo) {
		sqlSession.insert("FaqDAO.insert", vo);
	}
	
	public void update(FaqVO vo) {
		sqlSession.update("FaqDAO.update", vo);
	}
	
	public boolean checkPW(FaqVO vo) {
		boolean result = false;
		
		int count = sqlSession.selectOne("FaqDAO.checkPW", vo);
		
		if(count == 1)
			result = true;
		
		return result;
	}
}
