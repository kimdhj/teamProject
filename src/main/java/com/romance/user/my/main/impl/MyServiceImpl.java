package com.romance.user.my.main.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.notice.NoticeVO;
import com.romance.user.book.BookVO;
import com.romance.user.my.main.MyService;
import com.romance.user.my.request.MyRequestVO;
import com.romance.user.orders.OrdersVO;

@Service("myService")
public class MyServiceImpl implements MyService {
	@Autowired
	MyServiceDAO dao;

	public int owncoupon(String user_id) {
		return dao.owncoupon(user_id);
	}
	  
	@Override
	public List<OrdersVO> getMyMainOrders(String user_id) throws Exception {
		return dao.getMyMainOrders(user_id);
	}


	@Override
	public NoticeVO getRecentNotice() throws Exception {
		return dao.getRecentNotice();
	}

	@Override
	public List<MyRequestVO> myRecentRequest(String user_id) throws Exception {
		return dao.myRecentRequest(user_id);
	}

	@Override
	public List<BookVO> myRecentCart(String user_id) throws Exception {
		return dao.myRecentCart(user_id);
	};
	
	
	
  
}
