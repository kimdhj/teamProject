package com.romance.user.my.order.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.my.order.MyOrderService;

@Service("myOrderService")
public class MyOrderServiceImpl implements MyOrderService {
	
	@Autowired
	private MyOrderDAO myOrderDAO;
	
}
