package com.animal.domain;

import java.sql.Date;

public class BillVO {
	private int bno; // 주문서번호 o
	private int mno; // 회원DB(회원번호) o
	private int cuno; // 주문제작DB(주문제작번호) o
	private String mname; //받으시는분
	private int bcount; // 주문갯수 o
	private String ctitle;
	private String bdeli; //주소
	private String mtel; //전화번호
	private String bmemo; // 추가 메모
	private Date bdate; // 주문일자 o
	private String cutitle; //상품명
	private int bsellcount; //누적 수량
	private String bstate;

	public BillVO() {
	
	}

	@Override
	public String toString() {
		return "BillVO [bno=" + bno + ", mno=" + mno + ", cuno=" + cuno + ", mname=" + mname + ", bcount=" + bcount
				+ ", ctitle=" + ctitle + ", bdeli=" + bdeli + ", mtel=" + mtel + ", bmemo=" + bmemo + ", bdate=" + bdate
				+ ", cutitle=" + cutitle + ", bsellcount=" + bsellcount + ", bstate=" + bstate + "]";
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

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getBdeli() {
		return bdeli;
	}

	public void setBdeli(String bdeli) {
		this.bdeli = bdeli;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getBmemo() {
		return bmemo;
	}

	public void setBmemo(String bmemo) {
		this.bmemo = bmemo;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public String getCutitle() {
		return cutitle;
	}

	public void setCutitle(String cutitle) {
		this.cutitle = cutitle;
	}

	public int getBsellcount() {
		return bsellcount;
	}

	public void setBsellcount(int bsellcount) {
		this.bsellcount = bsellcount;
	}

	public String getBstate() {
		return bstate;
	}

	public void setBstate(String bstate) {
		this.bstate = bstate;
	}
	
}
