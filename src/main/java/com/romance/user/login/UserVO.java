package com.romance.user.login;

import java.util.Date;

import lombok.Data;
@Data
public class UserVO {
	private Date user_sub_start;
	private Date user_login_day;
	private int user_point;
	private int user_sub_count;
	private int user_sub_pay_after;
	private int user_sub_pay_before;
	private int user_enabled;
	private boolean user_state;
	private String user_password;
	private String user_email;
	private String user_id;
	private String user_remain_address;
	private String user_name;
	private String user_sub;
	private String user_logintype;
	private String user_address;
	private String user_zipcode;
	private String user_role;
	private String user_birth;
	private String user_phone;
	
}