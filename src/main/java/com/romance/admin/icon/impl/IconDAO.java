package com.romance.admin.icon.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.icon.BannerVO;
import com.romance.admin.icon.IconVO;

@Repository
public class IconDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public IconVO getIcon() {
		System.out.println("---> MyBatis로 getEvent() 기능 처리");
		return sqlSessionTemplate.selectOne("iconDAO.getIcon");
	}

	public List<BannerVO> getBanner() {
		System.out.println("---> MyBatis로 getEvent() 기능 처리");
		return sqlSessionTemplate.selectList("BannerDAO.getBanner");
	}
	
	public void deleteIcon() {
		sqlSessionTemplate.delete("iconDAO.deleteIcon");
	}
	
	public void insertIcon(IconVO vo) {
		sqlSessionTemplate.insert("iconDAO.insertIcon",vo);
	}

	public void deleteBanner() {
		sqlSessionTemplate.delete("BannerDAO.deleteBanner");
	}
	
	public List<String> getFileAddress() {
		return sqlSessionTemplate.selectList("BannerDAO.getFileAddress");
	}
	
	public void insertBanner(BannerVO vo) {
		sqlSessionTemplate.insert("BannerDAO.insertBanner",vo);
	}
	
}
