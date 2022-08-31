package com.romance.admin.notice;

import java.util.List;

public interface NoticeService {
	public List<NoticeVO> getNoticeList();
	public NoticeVO getNotice(NoticeVO vo);
	public void insertNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public NoticeVO selectSeq(int notice_seq);
	public boolean checkPW(NoticeVO vo);
}
