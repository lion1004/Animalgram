package com.animal.domain;

public class CenterVO {
	private int ctno; // �����ǹ�ȣ
	private int mno;
	private String nickname; // ���г���
	private String cttitle; // ����������
	private String ctcontent; // �����ǳ���
	private String ctstate;//�亯������
	
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