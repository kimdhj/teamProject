package com.romance.admin.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.login.UserService;
import com.romance.admin.login.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO getUser(UserVO vo) {
	
		return userDAO.getUser(vo);
	}
	
}
