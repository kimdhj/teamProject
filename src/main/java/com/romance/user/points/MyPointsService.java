package com.romance.user.points;

import com.romance.user.login.UserVO;

public interface MyPointsService {

	void createPoints(MyPointsVO vo);
	void addPoint(UserVO vo);
	UserVO renew(UserVO vo);
	
}
