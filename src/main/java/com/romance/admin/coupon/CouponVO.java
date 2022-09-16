package com.romance.admin.coupon;

import java.util.Date;

import lombok.Data;
@Data
public class CouponVO {
	private String user_id;
	private int coupon_seq;
	private String coupon_code;
	private Date coupon_date;
	private String coupon_name;
	private int coupon_effect;
}
