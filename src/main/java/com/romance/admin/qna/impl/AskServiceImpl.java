package com.romance.admin.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.qna.AskReplyVO;
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
	public AskVO getAsk(AskVO vo) {
		return ask.getAsk(vo);
	}
	
  @Override
  public AskReplyVO getAskReply(AskReplyVO arvo) {
    return ask.getAskReply(arvo);
  }
	
	@Override
	public void delete1(AskVO vo) {
		ask.delete(vo);
	}
	
	@Override
	public void delete2(AskReplyVO arvo) {
	  ask.delete(arvo);
	}
	
	@Override
	public void chkboxDelete1(List<String> ask_seq) {
  	for(String nSeq : ask_seq) {
  		int seq = Integer.parseInt(nSeq);
  		
  		AskVO vo = new AskVO();
  		vo.setAsk_seq(seq); // seq 가져가기
  		vo = getAsk(vo);
  		
  		System.out.println("seq: " + vo.getAsk_seq());
  		System.out.println("file: " + vo.getAsk_file());
  		System.out.println("getAsk: " + getAsk(vo));
  		
  		if(vo.getAsk_file() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
  			String key = vo.getAsk_file();
  			String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
  			String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
  			System.out.println("삭제된 key : " + fileName);
  			AwsS3 awsS3 = AwsS3.getInstance();
  			awsS3.delete(fileName);
  			
  			System.out.println(fileName);
  		}
  		
  		delete1(vo); // seq 가져온 vo 값 삭제해주기
  		System.out.println("serviceDelete: " + seq);
  		}
	}
	
	@Override
	public void chkboxDelete2(List<String> ask_seq) {
	  
	  for(String nSeq : ask_seq) {
      int seq = Integer.parseInt(nSeq);
      
      AskReplyVO arvo = new AskReplyVO();
      arvo.setAsk_seq(seq);
      
      System.out.println("chkboxDelete2 : " + arvo);
      
      arvo = getAskReply(arvo); // 얘가 null 이 되는 순간, String 으로 null 값이 들어가는 거 -> 걍 String 
      
      System.out.println("chkboxDelete222 : " + arvo);
      
      if(arvo != null) {
        if(arvo.getAsk_reply_file() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
          String key = arvo.getAsk_reply_file();
          String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
          String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
          System.out.println("삭제된 key : " + fileName);
          AwsS3 awsS3 = AwsS3.getInstance();
          awsS3.delete(fileName);
          
          System.out.println(fileName);
        }
        
        delete2(arvo); // seq 가져온 vo 값 삭제해주기
      }
      
      System.out.println("serviceDelete: " + seq);
      }
	}
	
	
	@Override
	public boolean checkPW(AskReplyVO arvo) {
	  return ask.checkPW(arvo);
	}
	
}
