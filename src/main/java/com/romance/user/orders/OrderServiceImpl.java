package com.romance.user.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDAO dao;
	@Override
	public OrderBookListVO ordersearch(int book_seq) {
		// TODO Auto-generated method stub
		return dao.ordersearch(book_seq);
	}
	@Override
	public void ordersIn(OrdersVO vo) {
		// TODO Auto-generated method stub
		dao.ordersIn(vo);
	}
	@Override
	public void booklistin(List<OrderBookListVO> vol) {
		// TODO Auto-generated method stub
		for(OrderBookListVO vo:vol) {
			dao.booklistin(vo);
		}
	}
	@Override
	public OrdersVO getorder(String vo) {
		// TODO Auto-generated method stub
		return dao.getorder(vo);
	}
	@Override
	public void delfin(String user_id) {
		dao.delfin(user_id);
		
	}
	

}
