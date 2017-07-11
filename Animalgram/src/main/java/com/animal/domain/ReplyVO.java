package com.animal.domain;

public class ReplyVO {
	private int arno; // 전체 댓글 번호
	private String nickname; // 회원DB(회원번호)
	private int antno; // 게시글DB(전체 게시글 번호)
	private String rcontent; // 댓글 내용
	private String rdate; // 댓글등록일자

	public ReplyVO() {
	
	}

	@Override
	public String toString() {
		return "ReplyVO [arno=" + arno + ", nickname=" + nickname + ", antno=" + antno + ", rcontent=" + rcontent
				+ ", rdate=" + rdate + "]";
	}

	public ReplyVO(int arno, String nickname, int antno, String rcontent, String rdate) {
		super();
		this.arno = arno;
		this.nickname = nickname;
		this.antno = antno;
		this.rcontent = rcontent;
		this.rdate = rdate;
	}

	public int getArno() {
		return arno;
	}

	public void setArno(int arno) {
		this.arno = arno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAntno() {
		return antno;
	}

	public void setAntno(int antno) {
		this.antno = antno;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
}