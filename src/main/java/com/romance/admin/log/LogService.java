package com.romance.admin.log;

import java.util.List;

public interface LogService {
	//로그인로그 토탈
	public int getLoginTotalCount() throws Exception;
	//로그인로그 목록
	public List<LoginLogVO> getLoginLogList(Criteria criteria) throws Exception;
	
	//작업로그 토탈
	public int getWorkTotalCount() throws Exception;
	
	//결제로그 토탈
//	public int getPaymentTotalCount() throws Exception;
	
}