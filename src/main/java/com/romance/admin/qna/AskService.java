package com.romance.admin.qna;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface AskService {
	List<AskVO> getAskList(AskSearchVO svo);
	int getCount(AskSearchVO svo);
	AskVO getAsk(AskVO vo); // Q
	AskReplyVO getAskReply(AskReplyVO arvo); // A
	
	void delete1(AskVO vo); // 질문 삭제
	void delete2(AskReplyVO arvo) ; // 답변 삭제
	void chkboxDelete1(List<String> ask_seq) throws FileNotFoundException, IOException; // 선택 삭제 - 질문
	void chkboxDelete2(List<String> ask_seq) throws FileNotFoundException, IOException; // 선택 삭제 - 답변
	
//	void insert(AskReplyVO arvo); // 등록
//	void update(AskReplyVO arvo); // 수정
	
	boolean checkPW(AskReplyVO arvo); // 비밀번호 체크
	
}
