package com.romance.user.my.delivery;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDAO {
  @Autowired
  SqlSessionTemplate sql;
  public List<DeliveryVO> deliverylist(DeliveryVO vo){
    return sql.selectList("delivery.deliverylist",vo);
    
  }
  public int deliverycount(DeliveryVO vo) {
    
    return sql.selectOne("delivery.deliverycount",vo);
  }
  public void deldelivery(int my_delivery_seq) {
    sql.delete("delivery.deldelivery",my_delivery_seq);
  }
  public void indelivery(DeliveryVO vo) {
    sql.insert("delivery.indelivery",vo);
    
  }
  public DeliveryVO onsdelivery(DeliveryVO vo) {
    return sql.selectOne("delivery.onsdelivery", vo);
    
  }
  public void userdelivery(DeliveryVO vo) {
    sql.update("delivery.userdelivery",vo);
  }
}
