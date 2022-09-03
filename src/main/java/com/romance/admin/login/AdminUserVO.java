package com.romance.admin.login;

import java.util.Date;

import lombok.Data;

@Data
public class AdminUserVO {
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_phone;
	private String user_email;
	private int user_point;
	private String user_zipcode;
	private String user_address;
	private String user_sub;
	private String user_role;
	private String user_remain_address;
	private Date user_sub_start;
	private String user_logintype;
	private int user_sub_count;
	private Date user_login_day;
	private String user_birth;
	private int user_state;
	private int user_sub_pay_after;
	private int user_sub_pay_before;
	private int user_enabled;
	private String user_coupon_cnt;
}
