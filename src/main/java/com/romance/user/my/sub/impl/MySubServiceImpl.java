package com.romance.user.my.sub.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.my.sub.MySubService;

@Service("My_Sub")
public class MySubServiceImpl implements MySubService {

	@Autowired
	private MySubDAO mySubDAO;
	
}
