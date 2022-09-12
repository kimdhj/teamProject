package com.romance.user.my.request.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.login.UserVO;
import com.romance.user.my.request.MyRequestService;
import com.romance.user.my.request.MyRequestVO;

@Service("myRequestService")
public class MyRequestServiceImpl implements MyRequestService {
	
	@Autowired
	private MyRequestDAO myRequestDAO;
	
	@Override
	public UserVO getUser(String session_user_id) {
		return myRequestDAO.getUser(session_user_id);
	}

	@Override
	public List<MyRequestVO> getRequestList(String session_user_id) {
		return myRequestDAO.getRequestList(session_user_id);
	}
	
	
	
}
