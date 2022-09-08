package com.romance.admin.faq;

import java.util.List;

public interface FaqService {
	List<FaqVO> getFaqList(FaqSearchVO svo);
	int getCount(FaqSearchVO svo);
	void delete(FaqVO vo);
	void chkboxDelete(List<String> FAQ_seq);
	FaqVO getFaq(FaqVO vo);
	
}
