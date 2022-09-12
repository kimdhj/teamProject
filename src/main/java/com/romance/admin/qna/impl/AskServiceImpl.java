package com.romance.admin.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.faq.FaqVO;
import com.romance.admin.qna.AskSearchVO;
import com.romance.admin.qna.AskService;
import com.romance.admin.qna.AskVO;
import com.romance.server.AwsS3;

@Service("qnaService")
public class AskServiceImpl implements AskService{
	@Autowired
	private AskDAO ask;
	
	@Override
	public List<AskVO> getAskList(AskSearchVO svo) {
		if(svo.getPage() == 0) {
			svo.setPage(1);
		}
		if(svo.getTitle() != null) {
			svo.setTitle(svo.getTitle().trim());
		}
		if(svo.getUser() != null) {
			svo.setUser(svo.getUser().trim());
		}
		if(svo.getStatus() != null) {
			svo.setStatus(svo.getStatus().trim());
		}
		
		return ask.getAskList(svo);
	}
	
	@Override
	public int getCount(AskSearchVO svo) {
		if(svo.getTitle() != null) {
			svo.setTitle(svo.getTitle().trim());
		}
		if(svo.getUser() != null) {
			svo.setUser(svo.getUser().trim());
		}
		if(svo.getStatus() != null) {
			svo.setStatus(svo.getStatus().trim());
		}
		
		return ask.getCount(svo);
	}
	
	@Override
	public void delete(AskVO vo) {
		ask.delete(vo);
	}
	
	@Override
	public void chkboxDelete(List<String> ask_seq) {
		
//	for(String nSeq : ask_seq) {
//		int seq = Integer.parseInt(nSeq);
//		
//		FaqVO vo = new FaqVO();
//		vo.setFAQ_seq(seq); // seq 가져가기
//		vo = getFaq(vo);
//		
//		System.out.println("seq: " + vo.getFAQ_seq());
//		System.out.println("seq: " + vo.getFAQ_fileName());
//		System.out.println("seq: " + vo.getFAQ_file());
//		System.out.println("getFaq: " + getFaq(vo));
//		
//		if(vo.getFAQ_fileName() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
//			String key = vo.getFAQ_fileName();
//			String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
//			String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
//			System.out.println("삭제된 key : " + fileName);
//			AwsS3 awsS3 = AwsS3.getInstance();
//			awsS3.delete(fileName);
//			System.out.println(fileName);
//		}
//		
//		delete(vo); // seq 가져온 vo 값 삭제해주기
//		System.out.println("serviceDelete: " + seq);
//		}
	}
}
