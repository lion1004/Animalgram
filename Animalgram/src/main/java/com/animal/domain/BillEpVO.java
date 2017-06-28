package com.animal.domain;

import java.sql.Date;

public class BillEpVO {
	private int beno; // 후기댓글번호
	private int bno; // 주문서DB(주문서번호)
	private int bestar; // 별점
	private String becontent; // 후기내용
	private Date bedate; // 후기등록날짜

	@Override
	public String toString() {
		return "BillEpVO [beno=" + beno + ", bno=" + bno + ", bestar=" + bestar + ", becontent=" + becontent
				+ ", bedate=" + bedate + "]";
	}

	public BillEpVO() {
	}

	public BillEpVO(int beno, int bno, int bestar, String becontent, Date bedate) {
		super();
		this.beno = beno;
		this.bno = bno;
		this.bestar = bestar;
		this.becontent = becontent;
		this.bedate = bedate;
	}

	public int getBeno() {
		return beno;
	}

	public void setBeno(int beno) {
		this.beno = beno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getBestar() {
		return bestar;
	}

	public void setBestar(int bestar) {
		this.bestar = bestar;
	}

	public String getBecontent() {
		return becontent;
	}

	public void setBecontent(String becontent) {
		this.becontent = becontent;
	}

	public Date getBedate() {
		return bedate;
	}

	public void setBedate(Date bedate) {
		this.bedate = bedate;
	}

}
