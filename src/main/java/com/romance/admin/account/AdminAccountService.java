package com.romance.admin.account;

import java.util.List;

import com.romance.admin.login.AdminUserVO;

public interface AdminAccountService {
	public List<AdminUserVO> getUserList(AdminUserVO vo);
	
	//Total 개수 얻기
	
}
