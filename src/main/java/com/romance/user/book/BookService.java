package com.romance.user.book;

import java.util.List;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.admin.sample.navcategory.NavCategoryVO;
import com.romance.user.reply.FineVO;
import com.romance.user.reply.ReplyVO;
import com.romance.user.reply.ReplysearchVO;

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
	public List<BookVO> mainbest(BookSearchVO vo);
	public List<BookVO> mainnew(BookSearchVO vo);
	public BookVO onesearch(int book_seq);
	public double avgsearch(int book_seq);
	public List<ReplyVO> replylist(ReplysearchVO vo);
	public int fineche(FineVO vo);
	public int countsum(FineVO vo);
	public int replycount(ReplysearchVO vo);
	public int detailbookcount();
	public List<BookVO> detailbooklist();
}
