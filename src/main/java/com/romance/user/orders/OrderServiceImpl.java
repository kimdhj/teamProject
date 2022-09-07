package com.romance.user.orders;

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

}
