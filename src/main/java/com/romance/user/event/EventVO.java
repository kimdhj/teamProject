package com.romance.user.event;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EventVO {
	private int event_seq;
	private String event_title;
	private String event_target;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date event_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date event_end_date;
	private boolean event_allday;
	private String event_content;
	private boolean event_top_event;
	private String event_file1;
	private MultipartFile uploadFile1;
	private String event_file2;
	private MultipartFile uploadFile2;
	private String event_file3;
	private MultipartFile uploadFile3;
	private String event_file4;
	private MultipartFile uploadFile4;
	private int event_cnt;
	private String event_thumbnail;
	private MultipartFile uploadThumbnail;

//	@XmlTransient
//	private String searchCondition;
//	@XmlTransient
//	private String searchKeyword;
	
	
	
}