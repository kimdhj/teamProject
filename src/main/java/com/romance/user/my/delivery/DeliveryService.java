package com.romance.user.my.delivery;

import java.util.List;

public interface DeliveryService {
  public List<DeliveryVO> deliverylist(DeliveryVO vo);
  public int deliverycount(DeliveryVO vo) ;
  public void deldelivery(List<Integer> delivery_seq);
  public void indelivery(DeliveryVO vo);
  public void onsdelivery(DeliveryVO vo);
}
