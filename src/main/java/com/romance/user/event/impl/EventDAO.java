package com.romance.user.event.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.event.EventVO;
import com.romance.user.points.MyPointsSearchVO;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int confirmdate(MyPointsSearchVO my) {
		return sqlSessionTemplate.selectOne("EventDAO.confirmdate", my);
	}
	
	public void insertEvent(EventVO vo) {
		System.out.println("---> MyBatis로 insertEvent() 기능 처리");
		sqlSessionTemplate.insert("EventDAO.insertEvent", vo);
	}
	
	public int topCheck(EventVO vo) {
		return sqlSessionTemplate.selectOne("EventDAO.topCheck", vo);
	}

	public void updateEvent(EventVO vo) {
		System.out.println("---> MyBatis로 updateEvent() 기능 처리");
		sqlSessionTemplate.update("EventDAO.updateEvent", vo);
	}

	public void deleteEvent(EventVO vo) {
		System.out.println("---> MyBatis로 deleteEvent() 기능 처리");
		sqlSessionTemplate.delete("EventDAO.deleteEvent", vo);
	}

	public EventVO getEvent(EventVO vo) {
		System.out.println("---> MyBatis로 getEvent() 기능 처리");
		return (EventVO) sqlSessionTemplate.selectOne("EventDAO.getEvent", vo);
	}

	public List<EventVO> getEventListTop(EventVO vo) {
		System.out.println("---> MyBatis로 getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("EventDAO.getEventListTop", vo);
	}
	
	public List<EventVO> getEventListBottom(EventVO vo) {
		System.out.println("---> MyBatis로 getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("EventDAO.getEventListBottom", vo);
	}

	public void countCnt(int seq) {
		sqlSessionTemplate.update("EventDAO.countCnt", seq);
	}
	
	public void bottomEvent() {
		sqlSessionTemplate.update("EventDAO.bottomEvent");
	}
	public void topEvent(Integer sendReq) {
		sqlSessionTemplate.update("EventDAO.topEvent", sendReq);
	}
	
	public void ajaxDel(int del) {
		sqlSessionTemplate.delete("EventDAO.ajaxDel", del);
	}
	public EventVO selectFile(int del) {
		return sqlSessionTemplate.selectOne("EventDAO.selectFile", del);
	}
	
}