package com.animal.domain;

import java.sql.Date;

public class BillVO {
	private int bno; // 주문서번호 o
	private int mno; // 회원DB(회원번호) o
	private int cuno; // 주문제작DB(주문제작번호) o
	private String mname; //받으시는분
	private int bcount; // 주문갯수 o
	private String bdeli; //주소
	private String mtel; //전화번호
	private String bmemo; // 추가 메모
	private Date bdate; // 주문일자 o
	private String cutitle; //상품명
	private int bsellcount; //누적 수량


	public BillVO() {
	}


	public BillVO(int bno, int mno, int cuno, String mname, int bcount, String bdeli, String mtel, String bmemo,
			Date bdate,String cutitle, int bsellcount) {
		super();
		this.bno = bno;
		this.mno = mno;
		this.cuno = cuno;
		this.mname = mname;
		this.bcount = bcount;
		this.bdeli = bdeli;
		this.mtel = mtel;
		this.bmemo = bmemo;
		this.bdate = bdate;
		this.cutitle = cutitle;
		this.bsellcount = bsellcount;
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


	public String getMaddr() {
		return bdeli;
	}


	public void setMaddr(String bdeli) {
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

	@Override
	public String toString() {
		return "BillVO [bno=" + bno + ", mno=" + mno + ", cuno=" + cuno + ", mname=" + mname + ", bcount=" + bcount
				+ ", bdeli=" + bdeli + ", mtel=" + mtel + ", bmemo=" + bmemo + ", bdate=" + bdate + ", cutitle="
				+ cutitle + ", bsellcount=" + bsellcount + "]";
	}

}
