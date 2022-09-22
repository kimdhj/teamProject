package com.romance.user.points;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.login.UserVO;

@Service
public class MyPointsServiceImpl implements MyPointsService {

	@Autowired
	private MyPointsDAO myPointsDAO;	
	
	@Override
	public void createPoints(MyPointsVO vo) {
		System.out.println("임플이죠1"+vo);
		myPointsDAO.createPoints(vo);
	}
	
	@Override
	public void addPoint(UserVO vo) {
		System.out.println("임플이죠2"+vo);
		myPointsDAO.addPoint(vo);
	}
	
	@Override
	public UserVO renew(UserVO vo) {
		return myPointsDAO.renew(vo);
	}
	
}
