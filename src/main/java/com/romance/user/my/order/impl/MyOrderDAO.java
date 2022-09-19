package com.romance.user.my.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.my.order.Criteria;
import com.romance.user.orders.OrdersVO;

@Repository
public class MyOrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int myOrderTotalCount(Criteria criteria) {
		return sqlSessionTemplate.selectOne("userOrder.myOrderTotalCount", criteria);
	}
	
	public List<OrdersVO> getMyOrderList(Criteria criteria) {
		return sqlSessionTemplate.selectList("userOrder.getMyOrderListWithPaging", criteria);
	}
	
	public OrdersVO getMyOrderDetail(int orders_seq) {
		return sqlSessionTemplate.selectOne("userOrder.getMyOrderDetail", orders_seq);
	}
}
