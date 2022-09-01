package com.romance.admin.notice;

import java.util.List;

public interface NoticeService {
	public List<NoticeVO> getNoticeList(NoticeSearchVO svo);
	public int getCount(NoticeSearchVO svo);
	public NoticeVO getNotice(NoticeVO vo);
	public void insertNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public NoticeVO selectSeq(int notice_seq);
	public boolean checkPW(NoticeVO vo);
	public void checkBox(List<String> notice_seq);
}
