package com.animal.domain;

import java.sql.Date;

public class SellerVO {
	private int sno; // �Ǹ��ڹ�ȣ
	private int mno; // ȸ��DB(ȸ����ȣ)
	private String sname; // �Ǹ��ڻ�ȣ��
	private String stel; // �Ǹ��ڹ�ȣ
	private String saddr; // �Ǹ��ּ�
	private Date sdate; // �Ǹ��� �������

	@Override
	public String toString() {
		return "SellerVO [sno=" + sno + ", mno=" + mno + ", sname=" + sname + ", stel=" + stel + ", saddr=" + saddr
				+ ", sdate=" + sdate + "]";
	}

	public SellerVO() {
	}

	public SellerVO(int sno, int mno, String sname, String stel, String saddr, Date sdate) {
		super();
		this.sno = sno;
		this.mno = mno;
		this.sname = sname;
		this.stel = stel;
		this.saddr = saddr;
		this.sdate = sdate;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getStel() {
		return stel;
	}

	public void setStel(String stel) {
		this.stel = stel;
	}

	public String getSaddr() {
		return saddr;
	}

	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

}
