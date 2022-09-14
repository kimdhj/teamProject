package com.romance.admin.faq;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface FaqService {
	List<FaqVO> getFaqList(FaqSearchVO svo);
	FaqVO getFaq(FaqVO vo);
	int getCount(FaqSearchVO svo);
	void delete(FaqVO vo);
	void chkboxDelete(List<String> FAQ_seq)  throws FileNotFoundException, IOException;
	void insert(FaqVO vo);
	void update(FaqVO vo);
	boolean checkPW(FaqVO vo);
}
