package com.romance.admin.trade;

import java.util.List;

public interface TradeService {
  public List<TradeJoinVO> mainlist(TradeSearchVO vo);
  public List<TradeJoinVO> cancellist(TradeSearchVO vo);
  public TradeJoinVO booklistdetail(int order_bookList_seq);
  public TradeJoinVO ordersdetail(int orders_seq); 
  public int maincount(TradeSearchVO vo);
  public int cancelcount(TradeSearchVO vo);
  
}
