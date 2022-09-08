package com.romance.admin.terms;

import java.util.List;

public interface termsService {
	public void insertTerms(termsVO vo);
	public List<termsVO> getTermsList(termsVO vo);
	public void countCnt(int seq);
	public termsVO getTerms(termsVO vo);
	public void alterTerms(termsVO vo);
}
 