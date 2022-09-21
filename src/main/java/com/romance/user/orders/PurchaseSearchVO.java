package com.romance.user.orders;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PurchaseSearchVO {
  private int page;
  private String user_id;
  private String searchkeyword; // 기준 ex) 어떤 컬럼을 검색할 것이냐
  private String searchcontent; // 검색 내용들 ex) 날짜, 제목 등
  private int searchcontentint; // 검색 내용들 ex) seq
  
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
  private Date startDate;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
  private Date endDate;
}
