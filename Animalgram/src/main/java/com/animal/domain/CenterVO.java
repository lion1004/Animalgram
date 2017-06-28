package com.animal.domain;

public class CenterVO {
	private int ctno; // 고객문의번호
	private int mno; // 고객번호
	private String cttitle; // 고객문의제목
	private String ctcontent; // 고객문의내용

	@Override
	public String toString() {
		return "CenterVO [ctno=" + ctno + ", mno=" + mno + ", cttitle=" + cttitle + ", ctcontent=" + ctcontent + "]";
	}

	public CenterVO() {
	}

	public CenterVO(int ctno, int mno, String cttitle, String ctcontent) {
		super();
		this.ctno = ctno;
		this.mno = mno;
		this.cttitle = cttitle;
		this.ctcontent = ctcontent;
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

}
