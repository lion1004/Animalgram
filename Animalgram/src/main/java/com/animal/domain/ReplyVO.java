package com.animal.domain;

import java.sql.Date;

public class ReplyVO {
	private int arno; // 전체 댓글 번호
	private int mno; // 회원DB(회원번호)
	private int antno; // 게시글DB(전체 게시글 번호)
	private int rno; // 각 게시글에 대한 댓글 번호
	private String rcontent; // 댓글 내용
	private Date rdate; // 댓글등록일자
	private Date rupdate; // 댓글수정일자

	@Override
	public String toString() {
		return "ReplyVO [arno=" + arno + ", mno=" + mno + ", antno=" + antno + ", rno=" + rno + ", rcontent=" + rcontent
				+ ", rdate=" + rdate + ", rupdate=" + rupdate + "]";
	}

	public ReplyVO() {

	}

	public ReplyVO(int arno, int mno, int antno, int rno, String rcontent, Date rdate, Date rupdate) {
		super();
		this.arno = arno;
		this.mno = mno;
		this.antno = antno;
		this.rno = rno;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rupdate = rupdate;
	}

	public int getArno() {
		return arno;
	}

	public void setArno(int arno) {
		this.arno = arno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getAntno() {
		return antno;
	}

	public void setAntno(int antno) {
		this.antno = antno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public Date getRupdate() {
		return rupdate;
	}

	public void setRupdate(Date rupdate) {
		this.rupdate = rupdate;
	}

}
