package com.romance.user.my.main.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.notice.NoticeVO;
import com.romance.user.book.BookVO;
import com.romance.user.my.request.MyRequestVO;
import com.romance.user.orders.OrdersVO;
@Repository
public class MyServiceDAO {
    @Autowired
    SqlSessionTemplate sql;
    public int owncoupon(String user_id) {
      return sql.selectOne("coupon.owncoupon",user_id);
    }
    
    public List<OrdersVO> getMyMainOrders(String user_id) {
    	return sql.selectList("userMain.getMyMainOrders", user_id);
    }
    
    public NoticeVO getRecentNotice() {
    	return sql.selectOne("userMain.getRecentNotice");
    }
    
    public List<MyRequestVO> myRecentRequest(String user_id) {
    	return sql.selectList("userMain.myRecentRequest", user_id);
    }
    
    public List<BookVO> myRecentCart(String user_id) {
    	return sql.selectList("userMain.myRecentCart", user_id);
    }
}
