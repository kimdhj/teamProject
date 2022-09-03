package com.romance.admin.account.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.account.AdminAccountService;
import com.romance.admin.account.Criteria;
import com.romance.admin.login.AdminUserVO;

@Service
public class AdminAccountServiceImpl implements AdminAccountService {
	
	@Autowired
	private AdminAccountDAO adminAccountDAO;
	
	@Override
	public List<AdminUserVO> getUserList(AdminUserVO vo) {
		
		return adminAccountDAO.getUserList(vo);
	}

	@Override
	public List<AdminUserVO> getUserListWithPaging(Criteria criteria) throws Exception {
		
		return adminAccountDAO.getUserListWithPaging(criteria);
	}

	@Override
	public int totalCount() throws Exception {
	
		return adminAccountDAO.totalCount();
	}
	
	
	
}
