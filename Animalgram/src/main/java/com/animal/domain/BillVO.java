package com.animal.domain;

import java.sql.Date;

public class BillVO {
	private int bno; // �ֹ�����ȣ o
	private int mno; // ȸ��DB(ȸ����ȣ) o
	private int cuno; // �ֹ�����DB(�ֹ����۹�ȣ) o
	private String mname; //�����ôº�
	private int bcount; // �ֹ����� o
	private String ctitle;
	private String bdeli; //�ּ�
	private String mtel; //��ȭ��ȣ
	private String bmemo; // �߰� �޸�
	private Date bdate; // �ֹ����� o
	private String cutitle; //��ǰ��
	private int bsellcount; //���� ����
	private String bstate;

	public BillVO() {
	
	}

	@Override
	public String toString() {
		return "BillVO [bno=" + bno + ", mno=" + mno + ", cuno=" + cuno + ", mname=" + mname + ", bcount=" + bcount
				+ ", ctitle=" + ctitle + ", bdeli=" + bdeli + ", mtel=" + mtel + ", bmemo=" + bmemo + ", bdate=" + bdate
				+ ", cutitle=" + cutitle + ", bsellcount=" + bsellcount + ", bstate=" + bstate + "]";
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

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getBdeli() {
		return bdeli;
	}

	public void setBdeli(String bdeli) {
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

	public String getBstate() {
		return bstate;
	}

	public void setBstate(String bstate) {
		this.bstate = bstate;
	}
	
}
