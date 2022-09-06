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
}
