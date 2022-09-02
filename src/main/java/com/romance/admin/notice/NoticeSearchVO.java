package com.romance.admin.notice;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeSearchVO {
	private int page; // 페이지 (현재 페이지)
	private int seq; // 번호
	private String title; // 제목
	private String content; // 내용
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate; // 시작 날짜
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate; // 끝 날짜
	
}
