package com.romance.user.book;

import java.util.List;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.admin.sample.navcategory.NavCategoryVO;

public interface BookService {
	public List<BookVO> booklist(BookSearchVO vo);
	public int bookcount(BookSearchVO vo);
	public List<BookVO> bestlist(BookSearchVO vo);
	public int bestcount(BookSearchVO vo);
	public List<BookVO> newlist(BookSearchVO vo);
	public int newcount(BookSearchVO vo);
	public List<CategoryVO> categoryko();
	public List<CategoryVO> categoryen();
	public List<NavCategoryVO> navlist();
}	
