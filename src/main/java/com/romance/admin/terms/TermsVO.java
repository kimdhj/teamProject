package com.romance.admin.terms;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TermsVO {
	private int terms_seq;
	private int terms_article_number;
	private String terms_title;
	private String terms_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date terms_date;
	private boolean terms_state;
}
