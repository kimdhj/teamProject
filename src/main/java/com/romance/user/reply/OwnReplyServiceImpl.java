package com.romance.user.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OwnReplyServiceImpl implements OwnReplyService {

	@Autowired
	OwnReplyDAO ownReplyDAO;
	
	
	@Override
	public List<ReplyVO> movingReview(ReplyVO vo){
		return ownReplyDAO.movingReview(vo);
	}
	
	@Override
	public int ajax_recount(ReplyVO vo) {
		return ownReplyDAO.ajax_recount(vo);
	}
	
	
	@Override
	public List<ReplyVO> ajax_rerecount(ReplyVO vo){
		return ownReplyDAO.movingReview(vo);
	}

}
