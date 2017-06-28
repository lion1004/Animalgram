package com.animal.domain;

public class CareVO {
	private int cno; // 훈련번호
	private int pno; // 전문가번호
	private String ctype; // 훈련종류
	private String ccontent; // 훈련내용

	@Override
	public String toString() {
		return "CareVO [cno=" + cno + ", pno=" + pno + ", ctype=" + ctype + ", ccontent=" + ccontent + "]";
	}

	public CareVO() {
	}

	public CareVO(int cno, int pno, String ctype, String ccontent) {
		super();
		this.cno = cno;
		this.pno = pno;
		this.ctype = ctype;
		this.ccontent = ccontent;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

}
