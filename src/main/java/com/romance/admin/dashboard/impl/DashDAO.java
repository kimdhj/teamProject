package com.romance.admin.dashboard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.dashboard.DashVO;

@Repository
public class DashDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public DashVO getSubRatio(DashVO dashVO) {
		System.out.println("Mybatis로 차트데이터 테스트용");
		return sqlSessionTemplate.selectOne("DashDAO.getSubRatio", dashVO);
	}
	

}
