package com.animal.domain;

public class CenterReplyVO {
	private int ctrno; // ���亯��ȣ
	private int ctno; // ���ǹ�ȣ
	private String ctrtitle; // �����Ǵ亱����
	private String ctrcontent; // �����Ǵ亯����

	public CenterReplyVO() {
		
	}
	
	@Override
	public String toString() {
		return "CenterReplyVO [ctrno=" + ctrno + ", ctno=" + ctno + ", ctrtitle=" + ctrtitle + ", ctrcontent="
				+ ctrcontent + "]";
	}

	public CenterReplyVO(int ctrno, int ctno, String ctrtitle, String ctrcontent) {
		super();
		this.ctrno = ctrno;
		this.ctno = ctno;
		this.ctrtitle = ctrtitle;
		this.ctrcontent = ctrcontent;
	}

	public int getCtrno() {
		return ctrno;
	}

	public void setCtrno(int ctrno) {
		this.ctrno = ctrno;
	}

	public int getCtno() {
		return ctno;
	}

	public void setCtno(int ctno) {
		this.ctno = ctno;
	}

	public String getCtrtitle() {
		return ctrtitle;
	}

	public void setCtrtitle(String ctrtitle) {
		this.ctrtitle = ctrtitle;
	}

	public String getCtrcontent() {
		return ctrcontent;
	}

	public void setCtrcontent(String ctrcontent) {
		this.ctrcontent = ctrcontent;
	}

}
