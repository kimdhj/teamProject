package com.romance.admin.log;

import java.util.Date;

import lombok.Data;

@Data
public class WorkLogVO {
	private int work_log_seq;
	private String work_log_id;
	private String work_log_target_id;
	private String work_log_contents;
	private Date work_log_day;
}
