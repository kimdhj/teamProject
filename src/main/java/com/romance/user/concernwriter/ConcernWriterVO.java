package com.romance.user.concernwriter;

import lombok.Data;

@Data
public class ConcernWriterVO {
  private int concern_writer_seq;
  private String concern_writer_date;
  private int author_seq;
  private String user_id;
}
