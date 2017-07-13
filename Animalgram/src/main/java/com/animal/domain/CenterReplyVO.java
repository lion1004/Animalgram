package com.animal.domain;

public class CenterReplyVO {
	private int ctrno; // 고객답변번호
	private int ctno; // 문의번호
	private String ctrtitle; // 고객문의답볍제목
	private String ctrcontent; // 고객문의답변내용

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
