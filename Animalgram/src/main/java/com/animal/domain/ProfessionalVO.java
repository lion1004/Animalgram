package com.animal.domain;

public class ProfessionalVO {
	private int pno; // 전문가번호
	private int mno; // 회원DB(회원번호)
	private String ptype; // 전문가 종류
	private String ptypeno; // 전문가 등록번호
	private int pcareer; // 전문가경력

	@Override
	public String toString() {
		return "ProfessionalVO [pno=" + pno + ", mno=" + mno + ", ptype=" + ptype + ", ptypeno=" + ptypeno
				+ ", pcareer=" + pcareer + "]";
	}

	public ProfessionalVO() {
	}

	public ProfessionalVO(int pno, int mno, String ptype, String ptypeno, int pcareer) {
		super();
		this.pno = pno;
		this.mno = mno;
		this.ptype = ptype;
		this.ptypeno = ptypeno;
		this.pcareer = pcareer;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPtypeno() {
		return ptypeno;
	}

	public void setPtypeno(String ptypeno) {
		this.ptypeno = ptypeno;
	}

	public int getPcareer() {
		return pcareer;
	}

	public void setPcareer(int pcareer) {
		this.pcareer = pcareer;
	}

}
