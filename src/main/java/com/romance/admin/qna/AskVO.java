package com.romance.admin.qna;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AskVO {
	private int ask_seq;
	private String ask_title;
	private String ask_content; // default : 답변대기
	private String ask_status;
	private String ask_file; // DB File
	private MultipartFile ask_uploadFile; // Server File
	private String ask_password;
	private String user_id;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date ask_date;
}
