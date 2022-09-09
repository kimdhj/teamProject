package com.romance.admin.account;

public class Criteria {
	private int pageNum; //현재 페이지 번호
	private int perPageNum; //한 페이지당 보여질 게시글의 갯수
	
	private String searchCondition; //검색조건
	private String searchKeyword; //검색키워드
	private String selectCondition; //선택조건
	
	public int getPageStart() {//특정 페이지의 게시글 시작 번호, 행 번호
		return (this.pageNum - 1) * this.perPageNum; //현재 페이지의 게시글 시작 번호
	}
	
	public Criteria() {
		this.pageNum = 1;
		this.perPageNum = 5;
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

	public String getSelectCondition() {
		return selectCondition;
	}

	public void setSelectCondition(String selectCondition) {
		this.selectCondition = selectCondition;
	}
	
}
