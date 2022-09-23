package com.romance.admin.log;

public class Pagination {
	private Criteria criteria;
	private int totalCount; //총 게시글 수
	private int startPage; //화면에 보여질 첫번째 페이지 번호 ,시작 페이지 번호
	private int endPage; //화면에 보여질 마지막 페이지 번호, 끝 페이지 번호
	private boolean prev; //다음 버튼 생성 여부
	private boolean next; //이전 버튼 생성 여부
	private int displayPageNum = 10; //화면 하단에 보여지는 페이지 버튼의 수 [1][2][3][4][5]
	
//	public Pagenation() {} //기본생성자
//	
//	public Pagenation(int totalCount) { //생성자로 검색기능을 사용했을때 발생한 totalCount를 받아서 사용
//		this.totalCount = totalCount;
//	}

	public Criteria getCriteria() {
		return this.criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

	public int getTotalCount() {
		return this.totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {
		// 끝 페이지 번호 = (현재 페이지 번호 / 화면에 보여질 페이지번호 갯수) * 화면에 보여질 페이지번호 갯수
		// Math.ceil (올림), Math.floor (내림), Math.rount(반올림)
		endPage = (int) (Math.ceil(criteria.getPageNum() / (double) displayPageNum) * displayPageNum);
		System.out.println("tempEndPage 계산 전 endPage값 : " + endPage);
		// 시작 페이지 번호
		startPage = (endPage - displayPageNum) + 1;
		if (startPage <= 0) {
			startPage = 1;
		}

		// 마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의 수
		int tempEndPage = (int) (Math.ceil(totalCount / (double) criteria.getPerPageNum()));
		if (endPage > tempEndPage) { //endPage가 tempEndPage보다 클 경우 endPage값을 tempEndPage값으로 바꿔준다 (실제 마지막페이지 값을 가져온다)
			endPage = tempEndPage;
		}
		System.out.println("tempEndPage계산 후 : " + tempEndPage);
		prev = startPage == 1 ? false : true;
		next = endPage * criteria.getPerPageNum() < totalCount ? true : false;
	}

	public int getStartPage() {
		return this.startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return this.endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return this.prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return this.next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return this.displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	@Override
	public String toString() {
		return "Pagenation [criteria=" + criteria + ", totalCount=" + totalCount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ "]";
	}
	
}
