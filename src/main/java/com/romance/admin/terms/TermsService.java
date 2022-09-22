package com.romance.admin.terms;

import java.util.List;

public interface TermsService {
	public void insertTerms(TermsVO vo);
	public List<TermsVO> getTermsList(TermsSearchVO svo);
	public void countCnt(int seq);
	public TermsVO getTerms(TermsVO vo);
	public void alterTerms(TermsVO vo);
	public int getCount(TermsSearchVO svo);
	public void deleteTerms(TermsVO vo);
}
 