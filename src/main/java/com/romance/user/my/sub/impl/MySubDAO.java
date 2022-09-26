package com.romance.user.my.sub.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.sample.category.CategoryVO;
import com.romance.user.book.BookSearchVO;
import com.romance.user.book.BookVO;
import com.romance.user.login.UserVO;
import com.romance.user.my.sub.MySubBookVO;
import com.romance.user.my.sub.SubPerVO;
import com.romance.user.orders.OrderBookListVO;
import com.romance.user.orders.OrdersVO;
import com.romance.user.usecategory.UserCategoryVO;

@Repository
public class MySubDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<String> getcate(UserVO vo) {
		return sqlSessionTemplate.selectList("SubscribeDAO.getcate",vo);
	}
	public List<BookVO> newcate(BookSearchVO vo){
		return sqlSessionTemplate.selectList("SubscribeDAO.newcate",vo);
	}
	public void subon(String user_id) {
	  System.out.println("구독 on");
	  sqlSessionTemplate.update("user.subon",user_id);
	}
	public void subdel(String user_id) {
    sqlSessionTemplate.update("user.subdel",user_id);
  }
	public void subupdate(UserVO vo) {
	  sqlSessionTemplate.update("user.subupdate",vo);
	}
	public int subselbookcount(MySubBookVO vo) {
	  return sqlSessionTemplate.selectOne("book.subselbookcount", vo);
	}
	public BookVO subselbook(MySubBookVO vo) {
    return sqlSessionTemplate.selectOne("book.subselbook", vo);
  }
	public List<Integer> suballcate(String user_id){
	  return sqlSessionTemplate.selectList("usercategory.suballcate", user_id);
	}
	public void inssubper(SubPerVO vo) {
	  sqlSessionTemplate.insert("SubscribeDAO.inssubper",vo);
	}
	public void delsubper(String user_id) {
	  sqlSessionTemplate.delete("SubscribeDAO.delsubper",user_id);
	}
	public UserVO onesearch(String user_id) {
	  return sqlSessionTemplate.selectOne("user.onesearch",user_id);
	}
	public void subinorder(UserVO vo) {
	  sqlSessionTemplate.insert("order.subinorder",vo);
	}
	public int suborderseq(String user_id) {
	  return sqlSessionTemplate.selectOne("order.suborderseq",user_id);
	}
	public void subinbook(OrderBookListVO vo) {
	  sqlSessionTemplate.insert("order.subinbook",vo);
	}
	public List<CategoryVO> getcatelist(){
	  return sqlSessionTemplate.selectList("Category.logincate");
	}
	public List<Integer> getcatemy(String user_id){
    return sqlSessionTemplate.selectList("usercategory.suballcate",user_id);
  }
	public String mybook(String user_id) {
	  return sqlSessionTemplate.selectOne("usercategory.mybook",user_id);
	}
	public void delcate(String user_id) {
	  sqlSessionTemplate.delete("usercategory.delcate",user_id);
	}
	public void joininsert(UserCategoryVO vo) {
	  sqlSessionTemplate.insert("usercategory.joininsert",vo);
	}
}
