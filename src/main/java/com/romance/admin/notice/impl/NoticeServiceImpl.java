package com.romance.admin.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.notice.NoticeService;
import com.romance.admin.notice.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDao;
	
	@Override
	public List<NoticeVO> getNoticeList() {
		return noticeDao.getNoticeList();
	}
}
