package com.romance.admin.coupon;

import java.util.Date;

import lombok.Data;

@Data
public class UserCouponVO {
	private int user_coupon_seq;
	private int user_coupon_effect;
	private String user_coupon_name;
	private String user_coupon_code;
	private Date user_coupon_date;
	private String user_id;
}
