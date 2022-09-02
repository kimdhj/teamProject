package com.romance.admin.account;

public class Criteria {
	private int page; //현재 페이지 번호
	private int perPageNum; //한 페이지당 보여질 게시글의 갯수
	
	public int getPageStart() {//특정 페이지의 게시글 시작 번호, 행 번호
		return (this.page - 1) * this.perPageNum; //현재 페이지의 게시글 시작 번호
	}
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public int getPage() {
		return this.page;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public void setPerPageNum(int pageCount) {
		int count = this.perPageNum;
		
		if(pageCount != count) {
			this.perPageNum = count;
		} else {
			this.perPageNum = pageCount;
		}
	}
	
}
