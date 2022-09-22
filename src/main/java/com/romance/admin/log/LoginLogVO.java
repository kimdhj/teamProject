package com.romance.admin.log;

import java.util.Date;

import lombok.Data;

@Data
public class LoginLogVO {
	private int login_log_seq;
	private String login_log_ip;
	private String login_log_url;
	private String login_log_id;
	private String login_log_browser;
	private String login_log_role;
	private String login_log_sucess;
	private Date login_log_day;
}
