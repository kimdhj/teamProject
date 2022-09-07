package com.romance.user.bucket;

import java.util.List;

import com.romance.user.book.BookVO;

public interface BucketService {
	public void insertone(BucketVO vo);
	public BookVO onesearch(int book_seq);
	public List<BookVO> makelist(List<BucketVO> blist);
	public List<BucketVO> bucgetlist(BucketSearchVO vo);
	public int chedouble(BucketVO vo);
	public void delbuc(int[] book_seq,String id);
	
}
