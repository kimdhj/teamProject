package com.romance.user.my.profile;

import com.romance.user.login.UserVO;

public interface MyProfileService {

	//세션등록 현재유저정보 가져오기
	public UserVO getSessionUser(String user_id) throws Exception;
	
	//회원탈퇴
	public void userWithdrawal(String user_id) throws Exception;
}


