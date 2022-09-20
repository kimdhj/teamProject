package com.romance.admin.terms;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TermsSearchVO {
	private int page;
	private int seq;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date endDate; //
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date date;
	
}
