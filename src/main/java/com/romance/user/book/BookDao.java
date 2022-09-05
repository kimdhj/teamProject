package com.romance.user.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.admin.sample.navcategory.NavCategoryVO;
import com.romance.user.reply.FineVO;
import com.romance.user.reply.ReplyVO;
import com.romance.user.reply.ReplysearchVO;

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
	public List<BookVO> mainbest(BookSearchVO vo){
		System.out.println("new");
		return sql.selectList("book.mainbest",vo);
	}
	public List<BookVO> mainnew(BookSearchVO vo){
		System.out.println("new");
		return sql.selectList("book.mainnew",vo);
	}
	public BookVO onesearch(int book_seq) {
		return sql.selectOne("book.onesearch", book_seq);
		
	}
	public Object avgsearch(int book_seq) {
		return sql.selectOne("reply.avgsearch", book_seq);
		
	}
	//리뷰관련
	public List<ReplyVO> replylist(ReplysearchVO vo) {
		return sql.selectList("reply.replylist",vo);
	}
	public int fineche(FineVO vo) {
		return sql.selectOne("fine.fineche",vo);
	}
	public int countsum(FineVO vo) {
		return sql.selectOne("fine.countsum",vo);
	}
	public int replycount(ReplysearchVO vo) {
		return sql.selectOne("reply.replycount",vo);
	}
	public int detailbookcount() {
		return sql.selectOne("book.detailbookcount");
	}
	public List<BookVO> detailbooklist(int page) {
		return sql.selectList("book.detailbooklist",page);
		
	}

}
