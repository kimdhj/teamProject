package com.romance.admin.log;
import java.util.Date;

import lombok.Data;

@Data
public class PaymentLogVO {
	private int payment_log_seq;
	private String payment_log_id;
	private String payment_log_money;
	private Date payment_log_day;
}
