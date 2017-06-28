package com.animal.domain;

import java.sql.Date;

public class BillVO {
	private int bno; // 주문서번호
	private int mno; // 회원DB(회원번호)
	private int cuno; // 주문제작DB(주문제작번호)
	private int bcount; // 주문갯수
	private String bmeno; // 추가 메모
	private String bdeli; // 주문 물품 받을 주소
	private Date bdate; // 주문일자

	@Override
	public String toString() {
		return "BillVO [bno=" + bno + ", mno=" + mno + ", cuno=" + cuno + ", bcount=" + bcount + ", bmeno=" + bmeno
				+ ", bdeli=" + bdeli + ", bdate=" + bdate + "]";
	}

	public BillVO() {
	}

	public BillVO(int bno, int mno, int cuno, int bcount, String bmeno, String bdeli, Date bdate) {
		super();
		this.bno = bno;
		this.mno = mno;
		this.cuno = cuno;
		this.bcount = bcount;
		this.bmeno = bmeno;
		this.bdeli = bdeli;
		this.bdate = bdate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getCuno() {
		return cuno;
	}

	public void setCuno(int cuno) {
		this.cuno = cuno;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getBmeno() {
		return bmeno;
	}

	public void setBmeno(String bmeno) {
		this.bmeno = bmeno;
	}

	public String getBdeli() {
		return bdeli;
	}

	public void setBdeli(String bdeli) {
		this.bdeli = bdeli;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

}
