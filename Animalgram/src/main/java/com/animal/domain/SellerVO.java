package com.animal.domain;

import java.sql.Date;

public class SellerVO {
	private int sno; // 판매자번호
	private int mno; // 회원DB(회원번호)
	private String nickname;
	private String sname; // 판매자상호명
	private String stel; // 판매자번호
	private String saddr; // 판매주소
	private Date sdate; // 판매자 등록일자
	
	@Override
	public String toString() {
		return "SellerVO [sno=" + sno + ", mno=" + mno + ", nickname=" + nickname + ", sname=" + sname + ", stel="
				+ stel + ", saddr=" + saddr + ", sdate=" + sdate + "]";
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getStel() {
		return stel;
	}
	public void setStel(String stel) {
		this.stel = stel;
	}
	public String getSaddr() {
		return saddr;
	}
	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
}
