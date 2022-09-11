package com.romance.admin.faq;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FaqVO {
	private int FAQ_seq;
	private String FAQ_bigsort;
	private String FAQ_smallsort;
	private String FAQ_ask;
	private String FAQ_answer;
	private MultipartFile FAQ_file; // Server 파일
	private String FAQ_fileName; // DB 파일
	private String FAQ_passwd;
}
