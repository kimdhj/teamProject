package com.romance.admin.trade;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class TradeJoinVO {
  private int orders_seq;
  private int order_bookList_seq;
  private String user_id;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
  private String orders_order_day;
  private String book_title;
  private String orders_status;
  private String order_bookList_count;
  private int sum;
}
