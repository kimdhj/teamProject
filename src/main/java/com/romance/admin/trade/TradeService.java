package com.romance.admin.trade;

import java.util.List;

import com.romance.user.orders.OrderBookListVO;
import com.romance.user.orders.OrdersVO;

public interface TradeService {
  public List<TradeJoinVO> mainlist(TradeSearchVO vo);
  public List<TradeJoinVO> cancellist(TradeSearchVO vo);
  public TradeJoinVO booklistdetail(int order_bookList_seq);
  public OrdersVO ordersdetail(int orders_seq); 
  public int maincount(TradeSearchVO vo);
  public int cancelcount(TradeSearchVO vo);
  public void delorderbooklist(TradeJoinVO vo) throws Exception;
  public List<OrderBookListVO> booklistsel(int orders_seq) ;
  public int chebookseq(int book_seq);
  public void updateorders(OrdersVO vo);
  public void booklistin(List<OrderBookListVO> vol);
  public void dellevel(TradeJoinVO vo)throws Exception;
  
}
