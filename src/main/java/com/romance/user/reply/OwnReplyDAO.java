package com.romance.user.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnReplyDAO {

	@Autowired
	 SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReplyVO> movingReview(ReplyVO vo) {
	    return sqlSessionTemplate.selectList("ReplyDAO.movingReview",vo);
	  }
	
	public int ajax_recount(ReplyVO vo) {
		return sqlSessionTemplate.selectOne("ReplyDAO.ajax_recount",vo);
	}
	
	public List<ReplyVO> ajax_rerecount(ReplyVO vo) {
		return sqlSessionTemplate.selectList("ReplyDAO.ajax_rerecount",vo);
	}
	
}
