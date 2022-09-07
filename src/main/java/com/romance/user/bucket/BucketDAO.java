package com.romance.user.bucket;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.amazonaws.services.s3.model.Bucket;
import com.romance.user.book.BookVO;

@Repository
public class BucketDAO {
	@Autowired
	SqlSessionTemplate sql;
	public void insertone(BucketVO vo) {
		sql.insert("bucket.insertone",vo);
	}
	public BookVO onesearch(int book_seq) {

		return sql.selectOne("book.onesearch",book_seq);
	}
	public List<BucketVO> bucgetlist(BucketSearchVO vo){
		return sql.selectList("bucket.bucgetlist",vo);
		
	}
	public int chedouble(BucketVO vo) {
		return sql.selectOne("bucket.chedouble", vo);
	}
	public void delbuc(BucketVO vo) {
		sql.delete("bucket.delbuc", vo);
	}

}
