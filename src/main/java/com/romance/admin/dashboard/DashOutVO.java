package com.romance.admin.dashboard;

import lombok.Data;

@Data
public class DashOutVO {
  private String titlestr; // int title 로 문자를 가져옴!
  private int count;
  private int title; // 상황에 맞게 번호 넣어주기
}
