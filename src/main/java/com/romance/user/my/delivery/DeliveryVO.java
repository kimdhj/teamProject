package com.romance.user.my.delivery;

import lombok.Data;

@Data
public class DeliveryVO {
  private int my_delivery_seq;
  private String user_id;
  private String my_delivery_address;
  private String my_delivery_nickname;
  private String my_delivery_remain_address;
  private String my_delivery_zipcode;
  private String my_delivery_name;
  private String my_delivery_phone;
  
  private int page;

}
