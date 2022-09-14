package com.romance.admin.notice.impl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.notice.NoticeSearchVO;
import com.romance.admin.notice.NoticeService;
import com.romance.admin.notice.NoticeVO;
import com.romance.server.AwsS3;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDao;
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeSearchVO svo) {
		if(svo.getPage() == 0) {
			svo.setPage(1);
		}
		if(svo.getTitle() != null) {
			svo.setTitle(svo.getTitle().trim());
		}
		if(svo.getContent() != null) {
			svo.setContent(svo.getContent().trim());
		}
		
		return noticeDao.getNoticeList(svo);
	}
	
	@Override
	public int getCount(NoticeSearchVO svo) {
		if(svo.getTitle() != null) {
			svo.setTitle(svo.getTitle().trim());
		}
		if(svo.getContent() != null) {
			svo.setContent(svo.getContent().trim());
		}
		return noticeDao.getCount(svo);
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
	public void delete(NoticeVO vo) {
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
	
	@Override
	public boolean checkPW(NoticeVO vo) {
		return noticeDao.checkPW(vo);
	}
	
	@Override
	public void checkBox(List<String> notice_seq) throws FileNotFoundException, IOException {
		for(String nSeq : notice_seq) {
			int seq = Integer.parseInt(nSeq);
			
			NoticeVO vo = new NoticeVO();
			vo.setNotice_seq(seq);
			vo = selectSeq(vo.getNotice_seq());
			
			System.out.println("delete : " + vo);
			
			if(vo.getNotice_fileName() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
				String key = vo.getNotice_fileName();
				String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
				String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
				System.out.println("key : " + fileName);
				AwsS3 awsS3 = AwsS3.getInstance();
				awsS3.delete(fileName);
				System.out.println(fileName);
			}
			
			deleteNotice(vo);
			System.out.println("Service : " + seq);
		}
	}
	
}
