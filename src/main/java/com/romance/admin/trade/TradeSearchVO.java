package com.romance.admin.trade;

import lombok.Data;

@Data
public class TradeSearchVO {
  private int page;
  private String searchkeyword; // 기준 ex) 어떤 컬럼을 검색할 것이냐
  private String searchcontent; // 검색 내용들 ex) 날짜, 제목 등
  private int searchcontentint; // 검색 내용들 ex) seq 
}
