package com.romance.admin.sample.navcategory;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class NavCategoryDAO {
	@Autowired
	SqlSessionTemplate sqlsession;
	public NavCategoryVO getItem(NavCategoryVO vo) {
		return sqlsession.selectOne("navCategory.getItem",vo);
	}
	public int updateItem(NavCategoryVO vo) {
		return sqlsession.update("navCategory.updateItem",vo);
	}
	public List<NavCategoryVO> navList() {
		return sqlsession.selectList("navCategory.getList");
	}
}

