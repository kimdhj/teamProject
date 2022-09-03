package com.romance.user.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.admin.sample.navcategory.NavCategoryVO;
@Service
public class BookServiceImpl implements BookService {
	@Autowired
	BookDao dao;
	@Override
	public List<BookVO> booklist(BookSearchVO vo) {
		// TODO Auto-generated method stub
		return dao.booklist(vo);
	}
	@Override
	public int bookcount(BookSearchVO vo) {
		// TODO Auto-generated method stub
		return dao.bookcount(vo);
	}
	@Override
	public List<BookVO> bestlist(BookSearchVO vo) {
		// TODO Auto-generated method stub
		return dao.bestlist(vo);
	}
	@Override
	public int bestcount(BookSearchVO vo) {
		// TODO Auto-generated method stub
		return dao.bestcount(vo);
	}
	@Override
	public List<BookVO> newlist(BookSearchVO vo) {
		// TODO Auto-generated method stub
		return dao.newlist(vo);
	}
	@Override
	public int newcount(BookSearchVO vo) {
		// TODO Auto-generated method stub
		return dao.newcount(vo);
	}
	@Override
	public List<CategoryVO> categoryko() {
		// TODO Auto-generated method stub
		return dao.categoryko();
	}
	@Override
	public List<CategoryVO> categoryen() {
		// TODO Auto-generated method stub
		return dao.categoryen();
	}
	@Override
	public List<NavCategoryVO> navlist() {
		// TODO Auto-generated method stub
		return dao.navlist();
	}
	
	
	

}
