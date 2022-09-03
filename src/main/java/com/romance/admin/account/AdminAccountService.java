package com.romance.admin.account;

import java.util.List;

import com.romance.admin.login.AdminUserVO;

public interface AdminAccountService {
	public List<AdminUserVO> getUserList(AdminUserVO vo);
	
	//게시물 목록 조회
	public List<AdminUserVO> getUserListWithPaging(Criteria criteria) throws Exception;
		
	//Total 개수 얻기
	public int totalCount() throws Exception;
}
