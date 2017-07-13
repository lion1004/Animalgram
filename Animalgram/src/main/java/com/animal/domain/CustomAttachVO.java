package com.animal.domain;

import java.util.Date;

public class CustomAttachVO {

	private String fullName;
	private int cuno;
	private Date cudate;
	
	public CustomAttachVO() {
		// TODO Auto-generated constructor stub
	}
	
	public CustomAttachVO(String fullName, int cuno, Date cudate) {
		super();
		this.fullName = fullName;
		this.cuno = cuno;
		this.cudate = cudate;
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
	public Date getCudate() {
		return cudate;
	}
	public void setCudate(Date cudate) {
		this.cudate = cudate;
	}

	@Override
	public String toString() {
		return "CustomAttachVO [fullName=" + fullName + ", cuno=" + cuno + ", cudate=" + cudate + "]";
	}
	
}
