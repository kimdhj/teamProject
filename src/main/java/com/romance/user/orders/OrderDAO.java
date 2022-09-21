package com.romance.user.orders;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.points.MyPointsVO;

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
	public void pointsin(MyPointsVO vo) {
	  sql.insert("points.pointsin",vo);
	}
	
	public List<PurchaseJoinVO> purchaseList(PurchaseSearchVO svo){
	  return sql.selectList("order.purchaselist", svo);
	}
	
	public int purchaseCount(PurchaseSearchVO svo) {
	  return sql.selectOne("order.purchaseCount", svo);
	}
	
}
