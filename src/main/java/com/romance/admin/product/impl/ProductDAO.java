package com.romance.admin.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	public String check_author(@RequestParam(name="author_seq") int author_seq) {
		return sqlSessionTemplate.selectOne("ProductDAO.check_author", author_seq);
	}
	
	public int check_isbn(@RequestParam(name="book_isbn") String book_isbn) {
		return sqlSessionTemplate.selectOne("ProductDAO.check_isbn", book_isbn);
	}
	
	public int check_category(@RequestParam(name="category_num") int category_num) {
		return sqlSessionTemplate.selectOne("ProductDAO.check_category", category_num);
	}
	
	public void del_product(@RequestParam(name="book_seq") int book_seq) {
		sqlSessionTemplate.delete("ProductDAO.del_product", book_seq);
	}
	
	public int product_Update(@RequestParam(name="book_seq") int book_seq) {
		return sqlSessionTemplate.selectOne("ProductDAO.product_Update", book_seq);
	}
	
}
