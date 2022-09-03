package com.romance.user.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.admin.sample.navcategory.NavCategoryVO;

@Repository
public class BookDao {
	@Autowired
	SqlSessionTemplate sql;
	public List<BookVO> booklist(BookSearchVO vo){
		return sql.selectList("book.booklist",vo);
	}
	public int bookcount(BookSearchVO vo){
		return sql.selectOne("book.bookcount",vo);
		
	}
	public List<BookVO> bestlist(BookSearchVO vo){
		return sql.selectList("book.bestbook",vo);
	}
	public int bestcount(BookSearchVO vo){
		return sql.selectOne("book.bestcount",vo);
		
	}
	public List<BookVO> newlist(BookSearchVO vo){
		System.out.println("new");
		return sql.selectList("book.newbook",vo);
	}
	public int newcount(BookSearchVO vo){
		System.out.println("new");
		return sql.selectOne("book.newcount",vo);
		
	}
	public List<CategoryVO> categoryko(){
		return sql.selectList("Category.categoryko");
	}
	public List<CategoryVO> categoryen(){
		return sql.selectList("Category.categoryen");
	}
	public List<NavCategoryVO> navlist(){
		return sql.selectList("navCategory.getList");
	}
	

}
