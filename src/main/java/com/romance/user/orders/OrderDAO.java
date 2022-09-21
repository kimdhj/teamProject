package com.romance.user.orders;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.coupon.MyCouponVO;
import com.romance.user.login.UserVO;
import com.romance.user.my.delivery.DeliveryVO;
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
	  System.out.println("delfin"+user_id);
		sql.delete("bucket.delfin",user_id);
		
	}
	public void pointsin(MyPointsVO vo) {
	  sql.insert("points.pointsin",vo);
	}
	public void refundpoints(UserVO vo) {
	  sql.update("user.refundpoints",vo);
	}
	public List<MyCouponVO> paycouponlist(String user_id){
	  return sql.selectList("usercoupon.paycouponlist",user_id);
	}
	public List<DeliveryVO> paydelivery(String user_id){
    return sql.selectList("delivery.paydelivery",user_id);
  }
	public void usecoupon(int user_coupon_seq) {
	  sql.delete("usercoupon.usecoupon",user_coupon_seq);
	}
	public DeliveryVO seledelivery(int my_delivery_seq) {
	  return sql.selectOne("delivery.seledelivery",my_delivery_seq);
	  
	}
}
