package com.romance.admin.reply;

import java.util.List;

import com.romance.user.book.BookVO;
import com.romance.user.orders.OrderBookListVO;

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
  
  void insert(ReplyVO vo); // review 작성
  BookVO getBookInfo(BookVO vo); // 책 상세정보 가져옴
  void reviewStateUpdate(OrderBookListVO blvo);
  void reviewUpdate(ReplyVO vo); // review 업데이트
  ReplyVO doubleReply(ReplyJoinVO rjvo);
}
