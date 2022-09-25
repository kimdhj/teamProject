package com.romance.user.reply;

import java.util.List;

public interface OwnReplyService {

	
	List<ReplyVO> movingReview(ReplyVO vo);
	int ajax_recount(ReplyVO vo);
	List<ReplyVO> ajax_rerecount(ReplyVO vo);
	
}
