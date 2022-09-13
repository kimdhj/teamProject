package com.romance.user.my.request;

import java.util.Date;

import lombok.Data;

@Data
public class MyRequestReplyVO {
	private int ask_reply_seq;
	private int ask_seq;
	private String ask_reply_writer;
	private Date ask_reply_date;
	private String ask_reply_content;
	private String ask_reply_file;
	private String ask_reply_password;
}
