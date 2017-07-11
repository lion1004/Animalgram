package com.animal.domain;

public class CareVO {
	private int cno; // 훈련번호
	private int cano;
	private int pno; // 전문가번호
	private String ctype; // 훈련종류
	private String ctitle;
	private String cdate; 
	 private String castate;
	private String cstate;
	private String cimage;
	private String ccontent; // 훈련내용
	@Override
	public String toString() {
		return "CareVO [cno=" + cno + ", cano=" + cano + ", pno=" + pno + ", ctype=" + ctype + ", ctitle=" + ctitle
				+ ", cdate=" + cdate + ", castate=" + castate + ", cstate=" + cstate + ", cimage=" + cimage
				+ ", ccontent=" + ccontent + "]";
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getCano() {
		return cano;
	}
	public void setCano(int cano) {
		this.cano = cano;
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
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getCastate() {
		return castate;
	}
	public void setCastate(String castate) {
		this.castate = castate;
	}
	public String getCstate() {
		return cstate;
	}
	public void setCstate(String cstate) {
		this.cstate = cstate;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	

}
