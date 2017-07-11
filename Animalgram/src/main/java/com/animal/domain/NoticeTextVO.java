package com.animal.domain;

public class NoticeTextVO {
	private int antno; // 전체 게시글 번호
	private String nickname;// 회원 닉네임
	private int nno; // 게시판DB(게시판 번호)
	private int ntno; // 각 게시판 당 게시글 번호
	private String ntitle; // 게시글 제목
	private String ntcontent; // 게시글 내용
	private String ntdate; // 게시글 등록일자
	private String ntupdate;//게시글 수정일자
	private int ncount;//조회수
	
	public NoticeTextVO() {
	
	}

	@Override
	public String toString() {
		return "NoticeTextVO [antno=" + antno + ", nickname=" + nickname + ", nno=" + nno + ", ntno=" + ntno
				+ ", ntitle=" + ntitle + ", ntcontent=" + ntcontent + ", ntdate=" + ntdate + ", ntupdate=" + ntupdate
				+ ", ncount=" + ncount + "]";
	}

	public int getAntno() {
		return antno;
	}

	public void setAntno(int antno) {
		this.antno = antno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getNtdate() {
		return ntdate;
	}

	public void setNtdate(String ntdate) {
		this.ntdate = ntdate;
	}

	public String getNtupdate() {
		return ntupdate;
	}

	public void setNtupdate(String ntupdate) {
		this.ntupdate = ntupdate;
	}

	public int getNcount() {
		return ncount;
	}

	public void setNcount(int ncount) {
		this.ncount = ncount;
	}
	
}