package com.romance.admin.author;

import lombok.Data;

@Data
public class AdminAuthorSearchVO {
  private int page;
  private int author_seq;
  private String  author_name;
}
