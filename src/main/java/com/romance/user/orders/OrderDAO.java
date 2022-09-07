package com.romance.user.orders;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	@Autowired
	SqlSessionTemplate sql;
	public OrderBookListVO ordersearch(int book_seq){
		return sql.selectOne("order.ordersearch",book_seq);
	}
	public void ordersIn(OrdersVO vo) {
		sql.insert("order.ordersIn",vo);
	}
	public void booklistin(OrderBookListVO vo) {
		sql.insert("order.booklistin",vo);
	}
	public OrdersVO getorder(String vo) {
		return sql.selectOne("order.getorder",vo);
	}
	public void delfin(String user_id) {
		sql.delete("bucket.delfin",user_id);
		
	}
}
