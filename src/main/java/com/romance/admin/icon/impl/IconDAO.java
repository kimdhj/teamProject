package com.romance.admin.icon.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.icon.BannerVO;
import com.romance.admin.icon.IconVO;

@Repository
public class IconDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public IconVO getIcon(IconVO vo) {
		System.out.println("---> MyBatis로 getEvent() 기능 처리");
		return (IconVO) sqlSessionTemplate.selectOne("IconDAO.getIcon", vo);
	}

	public BannerVO getBanner(BannerVO vo) {
		System.out.println("---> MyBatis로 getEvent() 기능 처리");
		return (BannerVO) sqlSessionTemplate.selectOne("IconDAO.getBanner", vo);
	}
	
	public void updateIcon(IconVO vo) {
		sqlSessionTemplate.update("IconDAO.updateIcon",vo);
	}

	public void updateBanner(BannerVO vo) {
		sqlSessionTemplate.update("IconDAO.updateBanner",vo);
	}
	
}
