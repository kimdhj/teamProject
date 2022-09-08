package com.romance.user.book;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BookVO {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	public Date book_publish_date;

	@JsonFormat(pattern = "##,###")
	public int book_price;
	public int category_num;
	public int book_remain;
	public int book_points;
	public int author_seq;
	public int book_seq;
	public int book_sellCount;
	public String book_title;
	public String book_publish;
	public String book_author;
	public String book_isbn;
	public String book_descript;
	public String book_imgURL;
	public String book_bigimgURL;
	

}
