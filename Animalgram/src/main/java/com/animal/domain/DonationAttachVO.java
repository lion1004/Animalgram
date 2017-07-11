package com.animal.domain;

import java.util.Date;

public class DonationAttachVO {

	private String fullName;
	private int dno;
	private Date ddate;
	
	public DonationAttachVO() {
		// TODO Auto-generated constructor stub
	}
	
	public DonationAttachVO(String fullName, int dno, Date ddate) {
		super();
		this.fullName = fullName;
		this.dno = dno;
		this.ddate = ddate;
	}
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}

	@Override
	public String toString() {
		return "CustomAttachVO [fullName=" + fullName + ", dno=" + dno + ", ddate=" + ddate + "]";
	}
	
}
