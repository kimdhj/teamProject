package com.romance.admin.faq;

import lombok.Data;

@Data
public class FaqSearchVO {
	private int page;
	private int seq;
	private String bigsort;
	private String smallsort;
	private String ask;
}
