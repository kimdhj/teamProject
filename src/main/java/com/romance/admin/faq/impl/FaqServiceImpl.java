package com.romance.admin.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.faq.FaqSearchVO;
import com.romance.admin.faq.FaqService;
import com.romance.admin.faq.FaqVO;

@Service("faqService")
public class FaqServiceImpl implements FaqService{
	@Autowired
	private FaqDAO faq;
	
	@Override
	public List<FaqVO> getFaqList(FaqSearchVO svo) {
		if(svo.getPage() == 0) {
			svo.setPage(1);
		}
		if(svo.getBigsort() != null) {
			svo.setBigsort(svo.getBigsort().trim());
		}
		if(svo.getSmallsort() != null) {
			svo.setSmallsort(svo.getSmallsort().trim());
		}
		if(svo.getAsk() != null) {
			svo.setAsk(svo.getAsk().trim());
		}
		
		return faq.getFaqList(svo);
	}
	
	@Override
	public int getCount(FaqSearchVO svo) {
		if(svo.getAsk() != null) {
			svo.setAsk(svo.getAsk().trim());
		}
		if(svo.getBigsort() != null) {
			svo.setBigsort(svo.getBigsort().trim());
		}
		if(svo.getSmallsort() != null) {
			svo.setSmallsort(svo.getSmallsort().trim());
		}
		return faq.getCount(svo);
	}
}
