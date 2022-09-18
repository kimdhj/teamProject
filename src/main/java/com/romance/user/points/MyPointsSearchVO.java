package com.romance.user.points;

import lombok.Data;

@Data
public class MyPointsSearchVO {
  private int page;
  private String user_id;
  private int state;
  private String points_date;
}
