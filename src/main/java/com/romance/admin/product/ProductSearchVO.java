package com.romance.admin.product;

import lombok.Data;

@Data
public class ProductSearchVO {

	private int page;
	private int seq;
	private String sort;
	private String thing;
	private int Hpage;
	private int Hseq;
	private String Hsort;
	private String Hthing;
	
}
