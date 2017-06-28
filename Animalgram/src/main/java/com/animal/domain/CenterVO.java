package com.animal.domain;

public class CenterVO {
	private int ctno; // �����ǹ�ȣ
	private int mno; // ����ȣ
	private String cttitle; // ����������
	private String ctcontent; // �����ǳ���

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
