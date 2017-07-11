package com.animal.domain;

import java.util.Date;

public class CustomAttachVO {

	private String fullName;
	private int cuno;
	private Date cdate;
	
	public CustomAttachVO() {
		// TODO Auto-generated constructor stub
	}
	
	public CustomAttachVO(String fullName, int cuno, Date cdate) {
		super();
		this.fullName = fullName;
		this.cuno = cuno;
		this.cdate = cdate;
	}
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getCuno() {
		return cuno;
	}
	public void setCuno(int cuno) {
		this.cuno = cuno;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	@Override
	public String toString() {
		return "CustomAttachVO [fullName=" + fullName + ", cuno=" + cuno + ", cdate=" + cdate + "]";
	}
	
}
