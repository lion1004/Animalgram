package com.animal.domain;

import java.sql.Date;

public class DonationVO {
	private int dno; // 나눔번호
	private int mno; // 회원DB(회원번호)
	private String dtitle; // 나눔제목
	private int dcount; // 나눔갯수
	private String dimage; // 나눔할 물품 이미지
	private String dcontent; // 나눔글 내용
	private String dstate; // 나눔 상태(대기,진행중,취소 등등)
	private Date ddate; // 나눔물품등록일자

	@Override
	public String toString() {
		return "DonationVO [dno=" + dno + ", mno=" + mno + ", dtitle=" + dtitle + ", dcount=" + dcount + ", dimage="
				+ dimage + ", dcontent=" + dcontent + ", dstate=" + dstate + ", ddate=" + ddate + "]";
	}

	public DonationVO() {
	}

	public DonationVO(int dno, int mno, String dtitle, int dcount, String dimage, String dcontent, String dstate,
			Date ddate) {
		super();
		this.dno = dno;
		this.mno = mno;
		this.dtitle = dtitle;
		this.dcount = dcount;
		this.dimage = dimage;
		this.dcontent = dcontent;
		this.dstate = dstate;
		this.ddate = ddate;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getDtitle() {
		return dtitle;
	}

	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}

	public int getDcount() {
		return dcount;
	}

	public void setDcount(int dcount) {
		this.dcount = dcount;
	}

	public String getDimage() {
		return dimage;
	}

	public void setDimage(String dimage) {
		this.dimage = dimage;
	}

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	public String getDstate() {
		return dstate;
	}

	public void setDstate(String dstate) {
		this.dstate = dstate;
	}

	public Date getDdate() {
		return ddate;
	}

	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}

}
