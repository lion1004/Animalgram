package com.animal.domain;

import java.sql.Date;

public class NoticeTextVO {
	private int antno; // 전체 게시글 번호
	private int mno; // 회원DB(회원번호)
	private int nno; // 게시판DB(게시판 번호)
	private int ntno; // 각 게시판 당 게시글 번호
	private String ntitle; // 게시글 제목
	private String ntcontent; // 게시글 내용
	private String ntimage; // 게시글이미지
	private Date ntdate; // 게시글 등록일자
	private Date ntupdate; // 게시글 수정일자

	@Override
	public String toString() {
		return "NoticeText [antno=" + antno + ", mno=" + mno + ", nno=" + nno + ", ntno=" + ntno + ", ntitle=" + ntitle
				+ ", ntcontent=" + ntcontent + ", ntimage=" + ntimage + ", ntdate=" + ntdate + ", ntupdate=" + ntupdate
				+ "]";
	}

	public NoticeTextVO() {
	}

	public NoticeTextVO(int antno, int mno, int nno, int ntno, String ntitle, String ntcontent, String ntimage,
			Date ntdate, Date ntupdate) {
		super();
		this.antno = antno;
		this.mno = mno;
		this.nno = nno;
		this.ntno = ntno;
		this.ntitle = ntitle;
		this.ntcontent = ntcontent;
		this.ntimage = ntimage;
		this.ntdate = ntdate;
		this.ntupdate = ntupdate;
	}

	public int getAntno() {
		return antno;
	}

	public void setAntno(int antno) {
		this.antno = antno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public int getNtno() {
		return ntno;
	}

	public void setNtno(int ntno) {
		this.ntno = ntno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNtcontent() {
		return ntcontent;
	}

	public void setNtcontent(String ntcontent) {
		this.ntcontent = ntcontent;
	}

	public String getNtimage() {
		return ntimage;
	}

	public void setNtimage(String ntimage) {
		this.ntimage = ntimage;
	}

	public Date getNtdate() {
		return ntdate;
	}

	public void setNtdate(Date ntdate) {
		this.ntdate = ntdate;
	}

	public Date getNtupdate() {
		return ntupdate;
	}

	public void setNtupdate(Date ntupdate) {
		this.ntupdate = ntupdate;
	}

}
