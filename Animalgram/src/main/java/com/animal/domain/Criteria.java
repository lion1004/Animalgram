package com.animal.domain;

public class Criteria {//������ ����(page)�� �� �������� ������ ���ڵ� ��(perPageNum)�� Ŭ������ ǥ��
	private int page;
	private int perPageNum;
	private String nickname;
	
	public Criteria() {
		//�⺻��
		page=1;
		perPageNum=3;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", nickname=" + nickname + "]";
	}

	public Criteria(int page, int perPageNum, String nickname) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.nickname = nickname;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		if(page<=0) this.page=1;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
		if(perPageNum<=0 || perPageNum>100) this.perPageNum=10;
	}
	
	public int getPageStart(){
		return (page-1)*perPageNum;//RowBounds�� offset���� ����� ���� ����
	}
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}