package com.romance.user.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;
	@Override
	public UserVO onesearch(String user_id) {
		UserVO vo=dao.onesearch(user_id);
		vo.setUser_password(null);
		return vo;
	}

}
