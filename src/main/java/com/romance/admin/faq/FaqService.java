package com.romance.admin.faq;

import java.util.List;

public interface FaqService {
	List<FaqVO> getFaqList(FaqSearchVO svo);
	int getCount(FaqSearchVO svo);
}
