package com.romance.user.my.request;

import java.util.List;

import com.romance.user.login.UserVO;

public interface MyRequestService {
	public UserVO getUser(String session_user_id);
	
	//나의문의 리스트
	public List<MyRequestVO> getRequestList(String session_user_id);
	
	public List<MyRequestVO> getMyRequestList(Criteria criteria);
	
	//나의문의 개수
	public int myRequestTotalCount(Criteria criteria);
}
