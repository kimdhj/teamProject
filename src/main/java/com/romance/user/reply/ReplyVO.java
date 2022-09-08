package com.romance.user.reply;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class ReplyVO {
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date reply_date;
	
	private int reply_point;
	private int reply_seq;
	private int book_seq;
	private boolean user_blank;
	private String user_id;
	private String reply_cotent;
	private int fine;
	private int finecount;
}
