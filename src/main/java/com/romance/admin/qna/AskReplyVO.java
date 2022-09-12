package com.romance.admin.qna;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AskReplyVO {
	private int ask_seq;
	private int ask_reply_seq;
	private String ask_reply_writer;
	private String ask_reply_content;
	private String ask_reply_file; // DB File
	private MultipartFile ask_reply_uploadFile; // Server File
	private String ask_reply_password;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date ask_reply_date;
}
