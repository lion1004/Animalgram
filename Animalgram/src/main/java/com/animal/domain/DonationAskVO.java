package com.animal.domain;

import java.sql.Date;

public class DonationAskVO {
	private int dano; // ������û����ȣ
	private int dno; // ����DB(������ȣ)
	private int mno; // ȸ��DB(ȸ����ȣ)
	private String dtitle; //��ǰ��
	private String dinfo; //��ǰ����	
	private String mname; // ���� ���� �ּ�
	private String maddr; // ���� ���� �ּ�
	private String mtel; //��ȭ��ȣ
	private String damemo; // ������û�� �޸�
	private Date dadate; // ������û����
	private String dastate; //��ۻ���
	
	public DonationAskVO() {
	}

	public DonationAskVO(int dano, int dno, int mno, String dtitle, String dinfo, String mname, String maddr,
			String mtel, String damemo, Date dadate, String dastate) {
		super();
		this.dano = dano;
		this.dno = dno;
		this.mno = mno;
		this.dtitle = dtitle;
		this.dinfo = dinfo;
		this.mname = mname;
		this.maddr = maddr;
		this.mtel = mtel;
		this.damemo = damemo;
		this.dadate = dadate;
	}

	public int getDano() {
		return dano;
	}

	public void setDano(int dano) {
		this.dano = dano;
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

	public String getDamemo() {
		return damemo;
	}

	public void setDamemo(String damemo) {
		this.damemo = damemo;
	}

	public Date getDadate() {
		return dadate;
	}

	public void setDadate(Date dadate) {
		this.dadate = dadate;
	}

	
	public String getDastate() {
		return dastate;
	}

	public void setDastate(String dastate) {
		this.dastate = dastate;
	}

	@Override
	public String toString() {
		return "DonationAskVO [dano=" + dano + ", dno=" + dno + ", mno=" + mno + ", dtitle=" + dtitle + ", dinfo="
				+ dinfo + ", mname=" + mname + ", maddr=" + maddr + ", mtel=" + mtel + ", damemo=" + damemo
				+ ", dadate=" + dadate + "]";
	}
	
}
