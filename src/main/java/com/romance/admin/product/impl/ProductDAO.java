package com.romance.admin.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.product.ProductSearchVO;
import com.romance.admin.product.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	public List<ProductVO> getProductList(ProductVO vo) {
		System.out.println("---> MyBatis로 getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("ProductDAO.getProductList", vo);
	}
	
	public List<ProductVO> ajax_search(ProductSearchVO svo) {
		return sqlSessionTemplate.selectList("ProductDAO.ajax_search", svo);
	}
	
	public int all_count(ProductSearchVO svo) {
		return sqlSessionTemplate.selectOne("ProductDAO.all_count", svo);
	}
}
