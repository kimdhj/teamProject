package com.romance.admin.trade;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
