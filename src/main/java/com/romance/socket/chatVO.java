package com.romance.socket;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class chatVO {
	int num;
	String real_chat_session;
	String realchatname;
	Date real_chat_date;
	String real_chat_content;
	String real_chat_state;

	
}
