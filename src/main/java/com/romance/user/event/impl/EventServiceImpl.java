package com.romance.user.event.impl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.server.AwsS3;
import com.romance.user.event.EventService;
import com.romance.user.event.EventVO;
import com.romance.user.points.MyPointsSearchVO;

@Service("EventService")
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO EventDAO;

	
	@Override
	public int confirmdate(MyPointsSearchVO my) {
		return EventDAO.confirmdate(my);
	}
	
	@Override
	public void insertEvent(EventVO vo) {
		EventDAO.insertEvent(vo);
	}
	
	@Override
	public int topCheck(EventVO vo) {
		return EventDAO.topCheck(vo);
	}

	@Override
	public void updateEvent(EventVO vo) throws FileNotFoundException, IOException {
		AwsS3 awsS3 = AwsS3.getInstance();
		EventVO eventVO = EventDAO.eventFile(vo);
		System.out.println("검색해온거"+eventVO.getEvent_thumbnail());
		System.out.println("새로만든거"+vo.getEvent_thumbnail());
		String key1 = null;
		String key2 = null;
		String key3 = null;
		String key4 = null;
		String key5 = null;
		if (eventVO.getEvent_file1()!=null) {
			key1 = eventVO.getEvent_file1();
		key1 = key1.replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		if (eventVO.getEvent_file2()!=null) {
			key2 = eventVO.getEvent_file2();
		key2 = key2.replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		if (eventVO.getEvent_file3()!=null) {
			key3 = eventVO.getEvent_file3();
		key3 = key3.replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		if (eventVO.getEvent_file4()!=null) {
			key4 = eventVO.getEvent_file4();
		key4 = key4.replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		if (eventVO.getEvent_thumbnail()!=null) {
			key5 = eventVO.getEvent_thumbnail();
		key5 = key5.replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		EventDAO.updateEvent(vo);
		if(key1!=null) {awsS3.delete(key1);}
		if(key2!=null) {awsS3.delete(key2);}
		if(key3!=null) {awsS3.delete(key3);}
		if(key4!=null) {awsS3.delete(key4);}
		if(key5!=null) {awsS3.delete(key5);}
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
	
	@Override
	public void topEvent(List<String> event_seq) {
		List<Integer> reqList = event_seq.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
		EventDAO.bottomEvent();
		System.out.println(reqList);
		for(int j=0; j<event_seq.size(); j++) {
			Integer sendReq = reqList.get(j);
			EventDAO.topEvent(sendReq);
			System.out.println(sendReq);
		}
	}
	
	@Override
	public void ajaxDel(int del) throws FileNotFoundException, IOException {
		AwsS3 awsS3 = AwsS3.getInstance();
		EventVO vo = EventDAO.selectFile(del);
		String file1 = null;
		String file2 = null;
		String file3 = null;
		String file4 = null;
		String file5 = null;
		if (vo.getEvent_file1()!=null) {
		file1 = vo.getEvent_file1().replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		if (vo.getEvent_file2()!=null) {
		file2 = vo.getEvent_file2().replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		if (vo.getEvent_file3()!=null) {
		file3 = vo.getEvent_file3().replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		if (vo.getEvent_file4()!=null) {
		file4 = vo.getEvent_file4().replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		if (vo.getEvent_thumbnail()!=null) {
		file5 = vo.getEvent_thumbnail().replace("https://doublejo.s3.ap-northeast-2.amazonaws.com/", ""); }
		System.out.println(file5);
		EventDAO.ajaxDel(del);
		if (file1!=null) {awsS3.delete(file1); }
		if (file2!=null) {awsS3.delete(file2); }
		if (file3!=null) {awsS3.delete(file3); }
		if (file4!=null) {awsS3.delete(file4); }
		if (file5!=null) {awsS3.delete(file5); }
	}
	
	@Override
	public EventVO showSub() {
		return EventDAO.showSub();
	}
	
}
