package com.romance.admin.terms;

import java.util.Date;

import lombok.Data;

@Data
public class termsVO {
	private int terms_seq;
	private int terms_article_number;
	private String terms_title;
	private String terms_content;
	private Date terms_date;
	private boolean terms_state;
}
