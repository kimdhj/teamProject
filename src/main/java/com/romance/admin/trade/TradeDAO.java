package com.romance.admin.trade;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.coupon.CouponVO;
import com.romance.user.coupon.MyCouponVO;
import com.romance.user.login.UserVO;
import com.romance.user.orders.OrdersVO;
import com.romance.user.points.MyPointsVO;

@Repository
public class TradeDAO {
  @Autowired
  SqlSessionTemplate sql;
  public List<TradeJoinVO> mainlist(TradeSearchVO vo) {
    System.out.println("list"+vo);
    return sql.selectList("trade.mainlist",vo);
  }
  public int maincount(TradeSearchVO vo) {

    return sql.selectOne("trade.maincount",vo);
  }
  public List<TradeJoinVO> cancellist(TradeSearchVO vo) {
    return sql.selectList("trade.cancellist",vo);
  }
  public int cancelcount(TradeSearchVO vo) {
    return sql.selectOne("trade.cancelcount",vo);
  }
  public TradeJoinVO booklistdetail(int order_bookList_seq) {
    
    return sql.selectOne("trade.booklistdetail",order_bookList_seq);
  }
public TradeJoinVO ordersdetail(int orders_seq) {
    
    return sql.selectOne("trade.ordersdetail",orders_seq);
  }
public void orderbookdel(TradeJoinVO vo) {
  sql.delete("order.orderbookdel",vo);
  
}
public void orderupdate(TradeJoinVO vo) {
  sql.update("order.orderupdate",vo);
  
}
public OrdersVO ordersel(TradeJoinVO vo) {
  return sql.selectOne("order.ordersel",vo);
  
}
public void ordersdel(TradeJoinVO vo) {
  sql.delete("order.ordersdel",vo);
}
public int chebooklist(TradeJoinVO vo) {
  return sql.selectOne("order.chebooklist",vo);
  
}
public void couponin(MyCouponVO vo) {
  sql.insert("usercoupon.couponin",vo);
  
}
public void orderpointupdate(TradeJoinVO vo) {
  sql.update("order.orderpointupdate",vo);
  
}
public void pointsin(MyPointsVO vo) {
  sql.insert("points.pointsin",vo);
}
public void refundpoints(UserVO vo) {
  sql.update("user.refundpoints",vo);
}

}
