package com.animal.domain;

public class CareProSelVO {

	private int cno;
	private int pno;
	private String ctype;
	private String ccontent;
	
	public CareProSelVO() {
	}

	@Override
	public String toString() {
		return "CareProSelVO [cno=" + cno + ", pno=" + pno + ", ctype=" + ctype + ", ccontent=" + ccontent + "]";
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
	
} // class
