package com.romance.user.my.sub.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.book.BookSearchVO;
import com.romance.user.book.BookVO;
import com.romance.user.login.UserVO;
import com.romance.user.my.sub.MySubService;

@Service("My_Sub")
public class MySubServiceImpl implements MySubService {

	@Autowired
	private MySubDAO mySubDAO;
	
	public List<String> getcate(UserVO vo){
		System.out.println("임플"+vo);
		System.out.println("임플"+mySubDAO.getcate(vo));
		return mySubDAO.getcate(vo);
	}
	
	public List<BookVO> newcate(BookSearchVO vo){
		return mySubDAO.newcate(vo);
	}

  @Override
  public void subdel(String user_id) {
    // TODO Auto-generated method stub
    mySubDAO.subdel(user_id);
  }

  @Override
  public void subon(String user_id) {
    // TODO Auto-generated method stub
    mySubDAO.subon(user_id);
  }

  @Override
  public void subupdate(UserVO vo) {
    // TODO Auto-generated method stub
    mySubDAO.subupdate(vo);
  }
  
	
}
