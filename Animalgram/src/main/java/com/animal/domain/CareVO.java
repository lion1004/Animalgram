package com.animal.domain;

public class CareVO {
	private int cno; // 훈련번호
	private int pno; // 전문가번호
	private String ctype; // 훈련종류
	private String ctitle;
	private String cdate; 
	private String cstate;
	private String cimage;
	private String ccontent; // 훈련내용



	@Override
	public String toString() {
		return "CareVO [cno=" + cno + ", pno=" + pno + ", ctype=" + ctype + ", ctitle=" + ctitle + ", cdate=" + cdate
				+ ", cstate=" + cstate + ", cimage=" + cimage + ", ccontent=" + ccontent + "]";
	}

	public CareVO() {
	}


	public CareVO(int cno, int pno, String ctype, String ctitle, String cdate, String cstate, String cimage,
			String ccontent) {
		super();
		this.cno = cno;
		this.pno = pno;
		this.ctype = ctype;
		this.ctitle = ctitle;
		this.cdate = cdate;
		this.cstate = cstate;
		this.cimage = cimage;
		this.ccontent = ccontent;
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
