package com.romance.user.my.request.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.login.UserVO;
import com.romance.user.my.request.Criteria;
import com.romance.user.my.request.MyRequestReplyVO;
import com.romance.user.my.request.MyRequestVO;

@Repository
public class MyRequestDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//세션 유저 정보
	public UserVO getUser(String session_user_id) {
		System.out.println("Mybatis로 세션에 저장된 user정보 가져오기");
		System.out.println(">>>DAO session_user_id값 : " + session_user_id);
		return sqlSessionTemplate.selectOne("userRequest.getUserToken", session_user_id);
	}
	
	public List<MyRequestVO> getRequestList(String session_user_id) {
		return sqlSessionTemplate.selectList("userRequest.getRequestList", session_user_id);
	}
	
	public List<MyRequestVO> getMyRequestList(Criteria criteria) {
		return sqlSessionTemplate.selectList("userRequest.getMyRequestList", criteria);
	}
	
	//나의문의 개수
	public int myRequestTotalCount(Criteria criteria) {
		return sqlSessionTemplate.selectOne("userRequest.myRequestTotalCount", criteria);
	}
	
	//문의글 상세
	public MyRequestVO getMyRequestDetail(MyRequestVO myRequestVO) {
		return sqlSessionTemplate.selectOne("userRequest.getMyRequestDetail", myRequestVO);
	}
	
	public MyRequestReplyVO getMyRequestReply(MyRequestReplyVO myRequestReplyVO) {
		return sqlSessionTemplate.selectOne("userRequest.getMyRequestReply", myRequestReplyVO);
	}
	
	//문의글 등록
	public void insertMyRequest(MyRequestVO myRequestVO) {
		System.out.println("Mybatis로 insertMyRequest 기능 처리");
		sqlSessionTemplate.insert("userRequest.insertMyRequest", myRequestVO);
	}
	
	//문의글 비밀번호 확인
	public String getMyRequestPassword(int ask_seq) {
		return sqlSessionTemplate.selectOne("userRequest.getMyRequestPassword", ask_seq);
	}
	
	//문의글 수정
	public void updateMyRequest(MyRequestVO myRequestVO) {
		sqlSessionTemplate.update("userRequest.updateMyRequest", myRequestVO);
	}
	
	//문의글 삭제
	public void deleteMyRequest(int ask_seq) {
		sqlSessionTemplate.delete("userRequest.deleteMyRequest", ask_seq);
	}
}
