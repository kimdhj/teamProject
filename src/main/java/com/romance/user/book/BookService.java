package com.romance.user.book;

import java.util.List;

public interface BookService {
	public List<BookVO> booklist(BookSearchVO vo);
	public int bookcount(BookSearchVO vo);
	public List<BookVO> bestlist(BookSearchVO vo);
	public int bestcount(BookSearchVO vo);
	public List<BookVO> newlist(BookSearchVO vo);
	public int newcount(BookSearchVO vo);
}	
