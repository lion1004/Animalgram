package com.animal.domain;

public class NoticeBoardVO {
	private int nno; // 게시판 번호
	private String nname; // 게시판 이름

	@Override
	public String toString() {
		return "NoticeBoardVO [nno=" + nno + ", nname=" + nname + "]";
	}

	public NoticeBoardVO() {
	}

	public NoticeBoardVO(int nno, String nname) {
		super();
		this.nno = nno;
		this.nname = nname;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

}
