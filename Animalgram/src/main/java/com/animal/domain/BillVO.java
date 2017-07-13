package com.animal.domain;

import java.sql.Date;

public class BillVO {
	private int bno; // �ֹ�����ȣ o
	private int mno; // ȸ��DB(ȸ����ȣ) o
	private int cuno; // �ֹ�����DB(�ֹ����۹�ȣ) o
	private String mname; //�����ôº�
	private int bcount; // �ֹ����� o
	private String bdeli; //�ּ�
	private String mtel; //��ȭ��ȣ
	private String bmemo; // �߰� �޸�
	private Date bdate; // �ֹ����� o
	private String cutitle; //��ǰ��
	private int bsellcount; //���� ����


	public BillVO() {
	}


	public BillVO(int bno, int mno, int cuno, String mname, int bcount, String bdeli, String mtel, String bmemo,
			Date bdate,String cutitle, int bsellcount) {
		super();
		this.bno = bno;
		this.mno = mno;
		this.cuno = cuno;
		this.mname = mname;
		this.bcount = bcount;
		this.bdeli = bdeli;
		this.mtel = mtel;
		this.bmemo = bmemo;
		this.bdate = bdate;
		this.cutitle = cutitle;
		this.bsellcount = bsellcount;
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


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public int getBcount() {
		return bcount;
	}


	public void setBcount(int bcount) {
		this.bcount = bcount;
	}


	public String getMaddr() {
		return bdeli;
	}


	public void setMaddr(String bdeli) {
		this.bdeli = bdeli;
	}


	public String getMtel() {
		return mtel;
	}


	public void setMtel(String mtel) {
		this.mtel = mtel;
	}


	public String getBmemo() {
		return bmemo;
	}


	public void setBmemo(String bmemo) {
		this.bmemo = bmemo;
	}


	public Date getBdate() {
		return bdate;
	}


	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}


	public String getCutitle() {
		return cutitle;
	}


	public void setCutitle(String cutitle) {
		this.cutitle = cutitle;
	}

	
	public int getBsellcount() {
		return bsellcount;
	}


	public void setBsellcount(int bsellcount) {
		this.bsellcount = bsellcount;
	}

	@Override
	public String toString() {
		return "BillVO [bno=" + bno + ", mno=" + mno + ", cuno=" + cuno + ", mname=" + mname + ", bcount=" + bcount
				+ ", bdeli=" + bdeli + ", mtel=" + mtel + ", bmemo=" + bmemo + ", bdate=" + bdate + ", cutitle="
				+ cutitle + ", bsellcount=" + bsellcount + "]";
	}

}
