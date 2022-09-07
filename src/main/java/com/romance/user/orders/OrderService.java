package com.romance.user.orders;

import java.util.List;

public interface OrderService {
	public OrderBookListVO ordersearch(int book_seq);
	public void ordersIn(OrdersVO vo);
	public void booklistin(List<OrderBookListVO> vol);
	public OrdersVO getorder(String vo);
	public void delfin(String user_id);
}
