package com.romance.admin.notice;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_seq;
	private String notice_title;
	private String notice_writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date notice_date;
	private String notice_content;
	private MultipartFile notice_file;
	private String notice_fileName;
	private String notice_location;
	private String notice_passwd;
	private int notice_cnt;
}
