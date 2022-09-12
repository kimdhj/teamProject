package com.romance.socket;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class chatVO {
	int num;
	String real_chat_session;
	String realchatname;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date real_chat_date;
	String real_chat_content;
	String real_chat_state;

	
}
