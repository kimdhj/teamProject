package com.romance.admin.reply;

import java.util.List;

public interface ReplyService {
  List<ReplyJoinVO> getReplyList(ReplySearchVO svo);
  int getCount(ReplySearchVO svo);
  
  ReplyVO getReply(ReplyVO vo);
  
  void delete(ReplyVO vo);
  void chkboxDelete(List<String> reply_seq);
  
  void blind(ReplyVO vo);
  void blindCancel(ReplyVO vo);
  void chkboxBlind(List<String> reply_seq);
  void chkboxBlindCancel(List<String> reply_seq);
}
