package com.romance.user.my.order;

import java.util.List;

import com.romance.user.orders.OrdersVO;

public interface MyOrderService {
	
	//나의 주문 카운트
	public int myOrderTotalCount(Criteria criteria) throws Exception;
	
	//나의 주문 리스트
	public List<OrdersVO> getMyOrderList(Criteria criteria) throws Exception;
	
	//나의 주문 상세
	public OrdersVO getMyOrderDetail(int orders_seq)throws Exception; 
}
