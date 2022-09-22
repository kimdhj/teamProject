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
}
