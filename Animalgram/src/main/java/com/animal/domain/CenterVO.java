package com.animal.domain;

public class CenterVO {
	private int ctno; // 고객문의번호
	private int mno;
	private String nickname; // 고객닉네임
	private String cttitle; // 고객문의제목
	private String ctcontent; // 고객문의내용
	private String ctstate;//답변대기상태
	
	public CenterVO() {
	
	}

	@Override
	public String toString() {
		return "CenterVO [ctno=" + ctno + ", mno=" + mno + ", nickname=" + nickname + ", cttitle=" + cttitle
				+ ", ctcontent=" + ctcontent + ", ctstate=" + ctstate + "]";
	}

	public int getCtno() {
		return ctno;
	}

	public void setCtno(int ctno) {
		this.ctno = ctno;
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

	public String getCttitle() {
		return cttitle;
	}

	public void setCttitle(String cttitle) {
		this.cttitle = cttitle;
	}

	public String getCtcontent() {
		return ctcontent;
	}

	public void setCtcontent(String ctcontent) {
		this.ctcontent = ctcontent;
	}

	public String getCtstate() {
		return ctstate;
	}

	public void setCtstate(String ctstate) {
		this.ctstate = ctstate;
	}

}