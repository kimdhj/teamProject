package com.romance.admin.account;

import java.util.List;

import com.romance.admin.login.AdminUserVO;

public interface AdminAccountService {
	public AdminUserVO getUserDetail(AdminUserVO vo);
	
	//총 회원 목록 조회
	public List<AdminUserVO> getUserListWithPaging(Criteria criteria) throws Exception;
	
	//관리자 목록 조회
	public List<AdminUserVO> getAdminListWithPaging(Criteria criteria) throws Exception;
	
	//Total 개수 얻기
	public int totalCount(Criteria criteria) throws Exception;
	
	//Admin Total 얻기
	public int adminTotalCount(Criteria criteria) throws Exception;
	
	//관리자계정 생성
	public void insertAdminAccount(AdminUserVO vo) throws Exception;
	
	//아이디 중복체크
	public int idCheck(String user_id) throws Exception;
}
