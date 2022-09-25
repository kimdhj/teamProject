package com.romance.user.orders;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PurchaseJoinVO {
  private int orders_seq;
  private int order_bookList_count; // 책 개수 구하기
  private int order_bookList_seq;
  private int book_seq;
  private String orders_status; // 검색
  private String orders_cache_uid; // 검색
  private String book_bigimgURL;
  private String book_title; // 검색
  private String book_author; // 검색
  private boolean order_bookList_review_complete; // 리뷰 여분
  
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
  private String orders_order_day; // 검색
}