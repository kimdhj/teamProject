package com.romance.user.my.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeliveryServiceImpl implements DeliveryService {
  @Autowired
  DeliveryDAO dao;

  @Override
  public List<DeliveryVO> deliverylist(DeliveryVO vo) {
    // TODO Auto-generated method stub
    return dao.deliverylist(vo);
  }

  @Override
  public int deliverycount(DeliveryVO vo) {
    // TODO Auto-generated method stub
    return dao.deliverycount(vo);
  }

  @Override
  public void deldelivery(List<Integer> delivery_seq) {
    // TODO Auto-generated method stub
    for(int de:delivery_seq) {
      dao.deldelivery(de);
    }
    
  }

  @Override
  public void indelivery(DeliveryVO vo) {
    // TODO Auto-generated method stub
    dao.indelivery(vo);
  }

  @Override
  public void onsdelivery(DeliveryVO vo) {
    // TODO Auto-generated method stub
    System.out.println("vo수정부분전"+vo);
    vo=dao.onsdelivery(vo);
    System.out.println("vo수정부분"+vo);
    dao.userdelivery(vo);
  
  }
  
  
}
