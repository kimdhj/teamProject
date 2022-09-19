package com.romance.user.my.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.my.order.Criteria;
import com.romance.user.my.order.MyOrderService;
import com.romance.user.orders.OrdersVO;

@Service("myOrderService")
public class MyOrderServiceImpl implements MyOrderService {
	
	@Autowired
	private MyOrderDAO myOrderDAO;

	@Override
	public int myOrderTotalCount(Criteria criteria) throws Exception {
		return myOrderDAO.myOrderTotalCount(criteria);
	}

	@Override
	public List<OrdersVO> getMyOrderList(Criteria criteria) throws Exception {
		return myOrderDAO.getMyOrderList(criteria);
	}

	@Override
	public OrdersVO getMyOrderDetail(int orders_seq) throws Exception {
		return myOrderDAO.getMyOrderDetail(orders_seq);
	}
	
	
}
