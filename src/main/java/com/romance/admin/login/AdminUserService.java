package com.romance.admin.login;

import com.romance.admin.log.LoginLogVO;

public interface AdminUserService {
	public AdminUserVO getUser(AdminUserVO vo);
	public void loginDay(String user_id);
	
	//로그인시 입력아이디가 존재하는아이디인지 확인
	public int isUserId(String inputId);
	
	//로그인 성공실패 및 user_role을 가져오기 위함.
	public AdminUserVO getLoginlogInfo(String inputId);
	
	//로그인 로그 삽입
	public void insertLoginLog(LoginLogVO loginLogVO);
	
	
}
