package com.romance.admin.terms;

import java.util.List;

public interface termsService {
	public void insertTerms(termsVO vo);
	public List<termsVO> getTermsList(termsVO vo);
}
 