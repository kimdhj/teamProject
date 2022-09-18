package com.romance.admin.product;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ProductVO {

	private int book_price;
	private int category_num;
	private int book_remain;
	private String book_descript;
	private String book_imgURL;
	private String book_bigimgURL;
	private MultipartFile imgFile0;
	private MultipartFile imgFile1;
	private String book_title;
	private int book_points;
	private String book_publish;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date book_publish_date;
	private int author_seq;
	private String book_author;
	private int book_seq;
	private int book_sellCount;
	private String book_isbn;
	
}
