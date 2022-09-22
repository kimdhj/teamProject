package com.romance.admin.reply;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {
  private int reply_seq; // 번호
  private int reply_point; // 별점
  private int book_seq; // 책 번호
  private String reply_cotent; // 내용
  private String user_id; // 유저 id
  private boolean user_blank; // 유저 댓글 블라인드 처리
  
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
  private Date reply_date; // 날짜
}
