package com.romance.user.event.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.event.EventService;
import com.romance.user.event.EventVO;

@Service("EventService")
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO EventDAO;

	@Override
	public void insertEvent(EventVO vo) {
		EventDAO.insertEvent(vo);
	}

	@Override
	public void updateEvent(EventVO vo) {
		EventDAO.updateEvent(vo);
	}

	@Override
	public void deleteEvent(EventVO vo) {
		EventDAO.deleteEvent(vo);
	}

	@Override
	public EventVO getEvent(EventVO vo) {
		return EventDAO.getEvent(vo);
	}

	@Override
	public List<EventVO> getEventListTop(EventVO vo) {
		return EventDAO.getEventListTop(vo);
	}
	
	@Override
	public List<EventVO> getEventListBottom(EventVO vo) {
		return EventDAO.getEventListBottom(vo);
	}
	
	@Override
	public void countCnt(int seq) {
		EventDAO.countCnt(seq);
	}
}
