package com.animal.domain;

import java.sql.Date;

public class BillEpVO {
	private int beno; // �ı��۹�ȣ
	private int bno; // �ֹ���DB(�ֹ�����ȣ)
	private int bestar; // ����
	private String becontent; // �ı⳻��
	private Date bedate; // �ı��ϳ�¥

	@Override
	public String toString() {
		return "BillEpVO [beno=" + beno + ", bno=" + bno + ", bestar=" + bestar + ", becontent=" + becontent
				+ ", bedate=" + bedate + "]";
	}

	public BillEpVO() {
	}

	public BillEpVO(int beno, int bno, int bestar, String becontent, Date bedate) {
		super();
		this.beno = beno;
		this.bno = bno;
		this.bestar = bestar;
		this.becontent = becontent;
		this.bedate = bedate;
	}

	public int getBeno() {
		return beno;
	}

	public void setBeno(int beno) {
		this.beno = beno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getBestar() {
		return bestar;
	}

	public void setBestar(int bestar) {
		this.bestar = bestar;
	}

	public String getBecontent() {
		return becontent;
	}

	public void setBecontent(String becontent) {
		this.becontent = becontent;
	}

	public Date getBedate() {
		return bedate;
	}

	public void setBedate(Date bedate) {
		this.bedate = bedate;
	}

}
