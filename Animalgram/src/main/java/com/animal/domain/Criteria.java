package com.animal.domain;

public class Criteria { 
	//������ ����(page)�� �� �������� ������ ���ڵ� ��(perPageNum) ǥ��
	private int page;
	private int perPageNum;
	
	public Criteria() {
		//�⺻��
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
		//RowBounds�� offset
		//new RowBounds(pageStart, perPageNum);
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	
	
}
