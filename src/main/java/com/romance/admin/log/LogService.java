package com.romance.admin.log;

import java.util.List;

public interface LogService {
	//로그인로그 토탈
	public int getLoginTotalCount(Criteria criteria) throws Exception;
	//로그인로그 목록
	public List<LoginLogVO> getLoginLogList(Criteria criteria) throws Exception;
	
	//작업로그 토탈
	public int getWorkTotalCount(Criteria criteria) throws Exception;
	//작업로그 목록
	public List<WorkLogVO> getWorkLogList(Criteria criteria) throws Exception;
	
	//결제로그 토탈
	public int getPaymentTotalCount(Criteria criteria) throws Exception;
	//결제로그 목록
	public List<PaymentLogVO> getPaymentLogList(Criteria criteria) throws Exception;
	
}
