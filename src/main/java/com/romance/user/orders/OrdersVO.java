package com.romance.user.orders;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class OrdersVO {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date orders_order_day;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date orders_vbank_Date;
	private int orders_seq;
	private int orders_coupon_effect;
	private int orders_point;
	private int orders_add_point;
	private String orders_delivery;
	private int orders_cache_sum;
	private int orders_delivery_company;
	private String user_id;
	private String orders_remainaddress;
	private String orders_name;
	private String orders_address;
	private String orders_vbank_name;
	private String orders_vbank_num;
	private String orders_cache_uid;
	private String orders_email;
	private String orders_title;
	private String orders_recommend;
	private String orders_zipcode;
	private String orders_cache_tool;
	private String orders_status;
	private String orders_phone;
	private String orders_refund_num;
	private String orders_refund_bank;
	private String orders_vbank_Date_String;
}
