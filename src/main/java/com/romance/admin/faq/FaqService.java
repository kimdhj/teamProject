package com.romance.admin.faq;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface FaqService {
	List<FaqVO> getFaqList(FaqSearchVO svo);
//	List<FaqVO> getOrderList(FaqSearchVO svo);
//	List<FaqVO> getDeliveryList(FaqSearchVO svo);
//	List<FaqVO> getChangeList(FaqSearchVO svo);
//	List<FaqVO> getUserList(FaqSearchVO svo);
	
	int getCount(FaqSearchVO svo);
//	int getOrderCount(FaqSearchVO svo);
//	int getDeliveryCount(FaqSearchVO svo);
//	int getChangeCount(FaqSearchVO svo);
//	int getUserCount(FaqSearchVO svo);

	FaqVO getFaq(FaqVO vo);
	void delete(FaqVO vo);
	void chkboxDelete(List<String> FAQ_seq)  throws FileNotFoundException, IOException;
	void insert(FaqVO vo);
	void update(FaqVO vo);
	boolean checkPW(FaqVO vo);
}
