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
	
	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		return noticeDao.getNotice(vo);
	}
	
	@Override
	public void insertNotice(NoticeVO vo) {
		noticeDao.insertNotice(vo);
	}

	@Override
	public void deleteNotice(NoticeVO vo) {
		noticeDao.deleteNotice(vo);
	}

	@Override
	public NoticeVO selectSeq(int notice_seq) {
		return noticeDao.selectSeq(notice_seq);
	}
	
	@Override
	public void updateNotice(NoticeVO vo) {
		noticeDao.updateNotice(vo);
	}
	
	// 비밀번호 확인
	@Override
	public boolean checkPW(NoticeVO vo) {
		return noticeDao.checkPW(vo);
	}
	
}
