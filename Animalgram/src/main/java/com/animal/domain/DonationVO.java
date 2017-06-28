package com.animal.domain;

import java.sql.Date;

public class DonationVO {
	private int dno; // ������ȣ
	private int mno; // ȸ��DB(ȸ����ȣ)
	private String dtitle; // ��������
	private int dcount; // ��������
	private String dimage; // ������ ��ǰ �̹���
	private String dcontent; // ������ ����
	private String dstate; // ���� ����(���,������,��� ���)
	private Date ddate; // ������ǰ�������

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
