package com.romance.user.coupon;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class MyCouponVO {
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
  private Date user_coupon_date;
  private int user_coupon_seq;
  private int user_coupon_effect;
  private String user_coupon_name;
  private String user_id;
  private String user_coupon_code;
}
