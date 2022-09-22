package com.romance.user.my.main;

import java.util.List;

import com.romance.admin.notice.NoticeVO;
import com.romance.user.book.BookVO;
import com.romance.user.my.request.MyRequestVO;
import com.romance.user.orders.OrdersVO;

public interface MyService {
  public int owncoupon(String user_id);
  
  //최신 공지글 가져오기
  public NoticeVO getRecentNotice() throws Exception;
  
  //마이페이지 메인 최근주문 (3개)
  public List<OrdersVO> getMyMainOrders(String user_id) throws Exception;
  
  //마이페이지 메인 최근문의 (3개)
  public List<MyRequestVO> myRecentRequest(String user_id) throws Exception;
  
  //마이페이지 메인 장바구니
  public List<BookVO> myRecentCart(String user_id) throws Exception;
  
}
