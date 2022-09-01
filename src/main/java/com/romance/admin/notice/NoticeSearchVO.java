package com.romance.admin.notice;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeSearchVO {
	private int page; // ������ (���� ������)
	private int seq; // ��ȣ
	private String title; // ����
	private String content; // ����
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate; // ���� ��¥
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate; // �� ��¥
	
}
