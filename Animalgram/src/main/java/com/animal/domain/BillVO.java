package com.animal.domain;

import java.sql.Date;

public class BillVO {
	private int bno; // �ֹ�����ȣ
	private int mno; // ȸ��DB(ȸ����ȣ)
	private int cuno; // �ֹ�����DB(�ֹ����۹�ȣ)
	private int bcount; // �ֹ�����
	private String bmeno; // �߰� �޸�
	private String bdeli; // �ֹ� ��ǰ ���� �ּ�
	private Date bdate; // �ֹ�����

	@Override
	public String toString() {
		return "BillVO [bno=" + bno + ", mno=" + mno + ", cuno=" + cuno + ", bcount=" + bcount + ", bmeno=" + bmeno
				+ ", bdeli=" + bdeli + ", bdate=" + bdate + "]";
	}

	public BillVO() {
	}

	public BillVO(int bno, int mno, int cuno, int bcount, String bmeno, String bdeli, Date bdate) {
		super();
		this.bno = bno;
		this.mno = mno;
		this.cuno = cuno;
		this.bcount = bcount;
		this.bmeno = bmeno;
		this.bdeli = bdeli;
		this.bdate = bdate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getCuno() {
		return cuno;
	}

	public void setCuno(int cuno) {
		this.cuno = cuno;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getBmeno() {
		return bmeno;
	}

	public void setBmeno(String bmeno) {
		this.bmeno = bmeno;
	}

	public String getBdeli() {
		return bdeli;
	}

	public void setBdeli(String bdeli) {
		this.bdeli = bdeli;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

}
