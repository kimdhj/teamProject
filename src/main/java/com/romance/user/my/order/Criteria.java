package com.romance.user.my.order;

import java.time.LocalDate;

public class Criteria {
	private int pageNum; //현재 페이지 번호
	private int perPageNum; //한 페이지당 보여질 게시글의 갯수
	
	private String session_user_id; //세션등록된 유저 아이디
	private String searchCondition; //검색조건
	private String searchKeyword; //검색키워드
	private String fromDate; //기간검색
	private String toDate; //기간검색
	private LocalDate fromDateFormat; //문자열로 받은 날짜형식 변환
	private LocalDate toDateFormat; //문자열로 받은 날짜형식 변환s
	private String order_status; //주문 취소관련 데이터만 가져오기위해
	
	
	public int getPageStart() {//특정 페이지의 게시글 시작 번호, 행 번호
		return (this.pageNum - 1) * this.perPageNum; //현재 페이지의 게시글 시작 번호
	}
	
	public Criteria() {
		this.pageNum = 1;
		this.perPageNum = 3;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	
	public void setPageNum(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSession_user_id() {
		return session_user_id;
	}

	public void setSession_user_id(String session_user_id) {
		this.session_user_id = session_user_id;
	}
	
	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public LocalDate getFromDateFormat() {
		return fromDateFormat;
	}

	public void setFromDateFormat(LocalDate fromDateFormat) {
		this.fromDateFormat = fromDateFormat;
	}

	public LocalDate getToDateFormat() {
		return toDateFormat;
	}

	public void setToDateFormat(LocalDate toDateFormat) {
		this.toDateFormat = toDateFormat;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	
	
}
