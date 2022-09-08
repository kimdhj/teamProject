package com.romance.user.orders;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
public class OrderBookListVO {
	private int orders_seq;
	private int order_bookList_count;
	private int book_seq;
	//주문 관련
	private String book_title;
	private String book_price;
	private String book_author;
	private String book_isbn;
	private String book_bigimgURL;
}
