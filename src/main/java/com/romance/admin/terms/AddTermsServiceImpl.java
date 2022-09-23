package com.romance.admin.terms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("addTermsService")
public class AddTermsServiceImpl implements AddTermsService {

	@Autowired
	private AddTermsDAO addTermsDAO;

	@Override
	public List<TermsVO> getAddTerms() {
		return addTermsDAO.getJoin_terms();
	}
	@Override
	public List<TermsVO> getAddsubTerms() {
		return addTermsDAO.getSub_terms();
	}
	
}
