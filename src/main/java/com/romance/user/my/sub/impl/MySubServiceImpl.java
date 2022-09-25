package com.romance.user.my.sub.impl;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.romance.user.book.BookSearchVO;
import com.romance.user.book.BookVO;
import com.romance.user.login.UserVO;
import com.romance.user.my.sub.MySubBookVO;
import com.romance.user.my.sub.MySubService;
import com.romance.user.my.sub.SubPerVO;
import com.romance.user.orders.OrderBookListVO;

@Service("My_Sub")
@Transactional
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
    mySubDAO.delsubper(user_id);
  }

  @Override
 
  public void subon(String user_id) {
    // TODO Auto-generated method stub
    mySubDAO.subon(user_id);
    //책 추가
    MySubBookVO vo=new MySubBookVO();
    vo.setCatelist(mySubDAO.suballcate(user_id));
    int count=mySubDAO.subselbookcount(vo);
    Random ran=new Random();
    int num=ran.nextInt(count-1)+1;
    vo.setRnum(num);
    BookVO vob=mySubDAO.subselbook(vo);
    mySubDAO.delsubper(user_id);
    SubPerVO vos= new SubPerVO();
    vos.setUser_id(user_id);
  
    vos.setBook_seq(vob.getBook_seq());
    mySubDAO.inssubper(vos);
    //결제정보 추가하기
    UserVO vou=mySubDAO.onesearch(user_id);
    mySubDAO.subinorder(vou);
    int seq=mySubDAO.suborderseq(user_id);
    OrderBookListVO vobb=new OrderBookListVO();
    vobb.setOrders_seq(seq);
    vobb.setBook_seq(vob.getBook_seq());
    mySubDAO.subinbook(vobb);
  }

  @Override
  public void subupdate(UserVO vo) {
    // TODO Auto-generated method stub
    mySubDAO.subupdate(vo);
  }
  
	
}
