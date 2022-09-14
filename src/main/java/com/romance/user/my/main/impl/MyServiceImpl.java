package com.romance.user.my.main.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.my.main.MyService;

@Service("myService")
public class MyServiceImpl implements MyService {
  @Autowired
  MyServiceDAO dao;
  public int owncoupon(String user_id) {
    return dao.owncoupon(user_id);
  };
}
