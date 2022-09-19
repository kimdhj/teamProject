package com.romance.admin.notice;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface NoticeService {
	public List<NoticeVO> getNoticeList(NoticeSearchVO svo);
	public int getCount(NoticeSearchVO svo);
	public NoticeVO getNotice(NoticeVO vo);
	public void insertNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	public void delete(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public NoticeVO selectSeq(int notice_seq);
	public boolean checkPW(NoticeVO vo);
	public void checkBox(List<String> notice_seq) throws FileNotFoundException, IOException;
	
	void cnt(int notice_seq);
}
