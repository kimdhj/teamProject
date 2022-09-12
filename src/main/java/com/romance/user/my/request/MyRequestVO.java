package com.romance.user.my.request;

import java.util.Date;

import lombok.Data;

@Data
public class MyRequestVO {
	private int ask_seq;
	private Date ask_date;
	private String ask_title;
	private String ask_content;
	private String ask_status;
	private String ask_file;
	private String ask_password;
	private String user_id;
}
