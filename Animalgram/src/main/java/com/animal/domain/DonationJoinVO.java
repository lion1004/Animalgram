package com.animal.domain;

public class DonationJoinVO {
	private int mno; // 회원DB(회원번호)
	private int dno; // 나눔DB(나눔글번호)

	@Override
	public String toString() {
		return "DonationJoinVO [mno=" + mno + ", dno=" + dno + "]";
	}

	public DonationJoinVO() {
	}

	public DonationJoinVO(int mno, int dno) {
		super();
		this.mno = mno;
		this.dno = dno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

}
