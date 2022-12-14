package com.romance.admin.notice;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_seq;
	private String notice_title;
	private String notice_writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date notice_date;
	private String notice_content;
	private MultipartFile notice_file; // Server 
	private String notice_fileName; // DB
	private String notice_location;
	private String notice_passwd;
	private int notice_cnt;
}
