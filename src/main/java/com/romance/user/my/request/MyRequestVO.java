package com.romance.user.my.request;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

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
	private String ask_dateToString;//ajax로 전송할때 문자열타입의 날짜를 위한 변수
}
