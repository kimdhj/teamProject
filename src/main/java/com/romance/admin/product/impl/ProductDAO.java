package com.romance.admin.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.product.ProductSearchVO;
import com.romance.admin.product.ProductVO;
import com.romance.user.concern.ConcernWriterVO;

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
	
	public void insertProduct(ProductVO vo) {
		sqlSessionTemplate.insert("ProductDAO.insertProduct", vo);
	}
	
	public ConcernWriterVO check_author(ConcernWriterVO vo) {
		return sqlSessionTemplate.selectOne("ProductDAO.check_author", vo);
	}
	
	public int check_isbn(ProductVO vo) {
		return sqlSessionTemplate.selectOne("ProductDAO.check_isbn", vo);
	}
	
	
	
}
