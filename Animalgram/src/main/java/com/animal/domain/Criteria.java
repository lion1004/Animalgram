package com.animal.domain;

public class Criteria { 
	//페이지 정보(page)와 한 페이지당 보여질 레코드 수(perPageNum) 표현
	private int page;
	private int perPageNum;
	
	public Criteria() {
		//기본값
		page = 1;
		perPageNum = 10;
	}

	public void setPage(int page) {
		this.page = page;
		if(page <= 0){
			this.page = 1;
		}
	}
	public int getPage() {
		return page;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 10;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public int getPageStart(){
		return (page - 1) * perPageNum;
		//RowBounds의 offset
		//new RowBounds(pageStart, perPageNum);
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	
	
}
