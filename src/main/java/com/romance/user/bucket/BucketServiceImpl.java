package com.romance.user.bucket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.book.BookVO;
@Service
public class BucketServiceImpl implements BucketService {
	@Autowired
	BucketDAO dao;
	@Override
	public void insertone(BucketVO vo) {
		dao.insertone(vo);
		
	}
	@Override
	public BookVO onesearch(int book_seq) {
		// TODO Auto-generated method stub
		return dao.onesearch(book_seq);
	}
	@Override
	public List<BucketVO> bucgetlist(BucketSearchVO vo) {
		if(vo.getPage()<=0) {
			vo.setPage(1);
		}
		return dao.bucgetlist(vo);
	}
	@Override
	public List<BookVO> makelist(List<BucketVO> blist) {
		List<BookVO> list=new ArrayList<BookVO>();
		for(BucketVO bu:blist) {
			list.add(onesearch(bu.getBook_seq()));
		}
		return list;
	}
	@Override
	public int chedouble(BucketVO vo) {
		// TODO Auto-generated method stub
		return dao.chedouble(vo);
	}
	
	@Override
	public void delbuc(int[] book_seq,String id) {
		BucketVO vo=new BucketVO();
		vo.setUser_id(id);
		for(int seq:book_seq) {
			vo.setBook_seq(seq);
			dao.delbuc(vo);
		}
		
		
	}
	
	
}
