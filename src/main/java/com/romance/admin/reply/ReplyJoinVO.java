package com.romance.admin.reply;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyJoinVO {
  private int reply_seq; // 리뷰 번호
  private int book_seq;
  private String reply_cotent;
  private String user_id;
  private String user_name;
  private String user_birth;
  private String user_sub;
  private String book_author;
  private String book_title;
  private String book_publish;
  private boolean user_blank;
  
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
  private Date reply_date;
}
