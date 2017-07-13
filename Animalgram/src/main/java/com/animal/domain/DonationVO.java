package com.animal.domain;

import java.sql.Date;
import java.util.Arrays;

public class DonationVO {
	private int dno; // ������ȣ
	private int mno; // ȸ��DB(ȸ����ȣ)
	private String dtitle; // ��������
	private String dinfo; 
	private String mname;
    private String maddr;
	private String mtel;
	private Date dadate; // ������ǰ�������
	private String dimage;
	private String ddate;	// ���� ���
	private String dstate;	// ��������
	

	public DonationVO() {
	}

	public DonationVO(int dno, int mno, String dtitle, String dinfo, String mname, String maddr, String mtel,
			Date dadate, String dimage, String ddate, String dstate) {
		super();
		this.dno = dno;
		this.mno = mno;
		this.dtitle = dtitle;
		this.dinfo = dinfo;
		this.mname = mname;
		this.maddr = maddr;
		this.mtel = mtel;
		this.dadate = dadate;
		this.dimage = dimage;
		this.ddate = ddate;
		this.dstate = dstate;
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

	public String getDinfo() {
		return dinfo;
	}

	public void setDinfo(String dinfo) {
		this.dinfo = dinfo;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public Date getDadate() {
		return dadate;
	}

	public void setDadate(Date dadate) {
		this.dadate = dadate;
	}

	public String getDimage() {
		return dimage;
	}

	public void setDimage(String dimage) {
		this.dimage = dimage;
	}

	public String getDdate() {
		return ddate;
	}

	public void setDdate(String ddate) {
		this.ddate = ddate;
	}

	public String getDstate() {
		return dstate;
	}

	public void setDstate(String dstate) {
		this.dstate = dstate;
	}

	@Override
	public String toString() {
		return "DonationVO [dno=" + dno + ", mno=" + mno + ", dtitle=" + dtitle + ", dinfo=" + dinfo + ", mname="
				+ mname + ", maddr=" + maddr + ", mtel=" + mtel + ", dadate=" + dadate + ", dimage=" + dimage
				+ ", ddate=" + ddate + ", dstate=" + dstate + "]";
	}

}
