package com.romance.user.points;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.login.UserVO;

@Repository
public class MyPointsDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void createPoints(MyPointsVO vo) {
		System.out.println("---> MyBatis로 insertEvent() 기능 처리");
		sqlSessionTemplate.insert("points.createPoints", vo);
	}
	
	public void addPoint(UserVO vo) {
		System.out.println("---> MyBatis로 updateEvent() 기능 처리");
		sqlSessionTemplate.update("points.addPoint", vo);
	}
	
	public UserVO renew(UserVO vo) {
		return sqlSessionTemplate.selectOne("points.renew",vo);
	}
	
}
