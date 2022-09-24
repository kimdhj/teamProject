package com.romance.admin.log;

public interface LoggingService {
	/*
	 * 로그인 로그는 유저와 어드민 로그인에 작업함.
	 * com.romance.admin.login
	 * com.romance.user.login
	 */
	
	//작업 로그
	//회원정보 수정
//	public void insertUserInfoWorkLog(WorkLogVO workLogVO) throws Exception;
	//쿠폰지급
	public void insertWorkLog(WorkLogVO workLogVO) throws Exception;
	
	//결제 로그
	public void insertPaymentLog(PaymentLogVO paymentLogVO) throws Exception;
}
