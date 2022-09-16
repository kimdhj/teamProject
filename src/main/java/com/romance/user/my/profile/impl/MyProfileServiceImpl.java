package com.romance.user.my.profile.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.login.UserVO;
import com.romance.user.my.profile.MyProfileService;

@Service("myProfileService")
public class MyProfileServiceImpl implements MyProfileService {

	@Autowired
	MyProfileDAO myProfileDAO;
	
	
	@Override
	public UserVO getSessionUser(String user_id) throws Exception {
		return myProfileDAO.getSessionUser(user_id);
	}

	@Override
	public void userWithdrawal(String user_id) throws Exception {
		myProfileDAO.userWithdrawal(user_id);		
	}

	@Override
	public void transPassword(UserVO userVO) throws Exception {
		myProfileDAO.transPassword(userVO);
	}
	
	
}
