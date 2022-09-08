package com.romance.user.book;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.admin.sample.navcategory.NavCategoryVO;
import com.romance.user.reply.FineVO;
import com.romance.user.reply.ReplyVO;
import com.romance.user.reply.ReplysearchVO;
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
	@Override
	public List<BookVO> mainbest(BookSearchVO vo) {
		// TODO Auto-generated method stub
		return dao.mainbest(vo);
	}
	@Override
	public List<BookVO> mainnew(BookSearchVO vo) {
		// TODO Auto-generated method stub
		return dao.mainnew(vo);
	}
	@Override
	public BookVO onesearch(int book_seq) {
		// TODO Auto-generated method stub
		return dao.onesearch(book_seq);
	}
	@Override
	public String avgsearch(int book_seq) {
		// TODO Auto-generated method stub
		double re=0;
		Object se=dao.avgsearch(book_seq);
		if(se==null) {
			re=0;
		}else {
			re= ((Number) se).doubleValue();
		}
		return String.format("%.1f",re);
	}
	@Override
	public List<ReplyVO> replylist(ReplysearchVO vo) {
		// TODO Auto-generated method stub
		List<ReplyVO> relist=dao.replylist(vo);
		FineVO fvo=new FineVO();
		fvo.setUser_id("user");
		for(ReplyVO re:relist) {
			fvo.setReply_seq(re.getReply_seq());
			
			re.setFinecount(countsum(fvo));
			re.setFine(fineche(fvo));
		}
		return relist;
	}
	@Override
	public int fineche(FineVO vo) {
		// TODO Auto-generated method stub
		return dao.fineche(vo);
	}
	@Override
	public int countsum(FineVO vo) {
		// TODO Auto-generated method stub
		return dao.countsum(vo);
	}
	@Override
	public int replycount(ReplysearchVO vo) {
		// TODO Auto-generated method stub
		return dao.replycount(vo);
	}
	@Override
	public int detailbookcount() {
		// TODO Auto-generated method stub
		return dao.detailbookcount();
	}
	@Override
	public List<BookVO> detailbooklist() {
		int count=detailbookcount()-8;
		Random rand = new Random();
		if(count>0) {
		count=rand.nextInt(count);
		}
		return dao.detailbooklist(count);
	}
	
	
	
	

}
