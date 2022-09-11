package com.romance.admin.dashboard;

import lombok.Data;

@Data
public class DashVO {
	private int sub_cnt;  //test
	private int normal_cnt; //test
	
	public DashVO() {
		this.sub_cnt = 1;
		this.normal_cnt = 99;
	}
}
