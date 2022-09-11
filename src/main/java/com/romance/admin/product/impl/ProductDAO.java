package com.romance.admin.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.product.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	public List<ProductVO> getProductList(ProductVO vo) {
		System.out.println("---> MyBatis로 getEventList() 기능 처리");
		return sqlSessionTemplate.selectList("ProductDAO.getProductList", vo);
	}
	
}
