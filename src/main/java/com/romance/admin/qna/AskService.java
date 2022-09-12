package com.romance.admin.qna;

import java.util.List;

public interface AskService {
	List<AskVO> getAskList(AskSearchVO svo);
	int getCount(AskSearchVO svo);
	
	void delete(AskVO vo);
	void chkboxDelete(List<String> ask_seq);
	
}
