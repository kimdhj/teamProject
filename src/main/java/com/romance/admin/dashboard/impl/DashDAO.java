package com.romance.admin.dashboard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.dashboard.DashDataVO;
import com.romance.admin.dashboard.DashOutVO;
import com.romance.admin.dashboard.DashVO;

@Repository
public class DashDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public DashVO getSubRatio(DashVO dashVO) {
		System.out.println("Mybatis로 차트데이터 테스트용");
		return sqlSessionTemplate.selectOne("DashDAO.getSubRatio", dashVO);
	}
	//한번으로 5개
	public List<DashOutVO> categorysel(DashDataVO vo) {
	 return sqlSessionTemplate.selectList("DashDAO.categorysel",vo);
	}
	public List<DashOutVO> booksel(DashDataVO vo) {
	   return sqlSessionTemplate.selectList("DashDAO.booksel",vo);
	  }
	//한개씩 5번
	 public DashOutVO dashcache(DashDataVO vo) {
     return sqlSessionTemplate.selectOne("DashDAO.dashcache",vo);
    }
	 public DashOutVO dashcount(DashDataVO vo) {
     return sqlSessionTemplate.selectOne("DashDAO.dashcount",vo);
    }
	 //도넛
	 public DashOutVO dashbookbuy(DashDataVO vo) {
     return sqlSessionTemplate.selectOne("DashDAO.dashbookbuy",vo);
    }
	 public DashOutVO dashreply(DashDataVO vo) {
     return sqlSessionTemplate.selectOne("DashDAO.dashreply",vo);
    }
	 //도넛2
	 public DashOutVO dashgetuser(DashDataVO vo) {
     return sqlSessionTemplate.selectOne("DashDAO.dashgetuser",vo);
    }
	 public DashOutVO dashgetsub(DashDataVO vo) {
     return sqlSessionTemplate.selectOne("DashDAO.dashgetsub",vo);
    }
	 //젤상단 두개
	 public DashOutVO dashnotcancelcount(DashDataVO vo) {
     return sqlSessionTemplate.selectOne("DashDAO.dashnotcancelcount",vo);
    }
	 public DashOutVO dashcancelcount(DashDataVO vo) {
     return sqlSessionTemplate.selectOne("DashDAO.dashcancelcount",vo);
    }

}
