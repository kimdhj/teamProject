package com.romance.user.event;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface EventService {
	
	void insertEvent(EventVO vo);
	void updateEvent(EventVO vo) throws FileNotFoundException, IOException;
	void deleteEvent(EventVO vo);
	EventVO getEvent(EventVO vo);
	List<EventVO> getEventListTop(EventVO vo);
	List<EventVO> getEventListBottom(EventVO vo);	
	void countCnt(int seq);
	void topEvent(List<String> event_seq);
	void ajaxDel(int del) throws FileNotFoundException, IOException;
	int topCheck(EventVO vo);
	
}
