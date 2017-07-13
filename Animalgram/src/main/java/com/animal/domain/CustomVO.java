package com.animal.domain;

import java.util.Arrays;
import java.util.Date;

public class CustomVO {
	
	  private int cuno; 
	  private int sno; 
	  private String cutitle; 
	  private String cuinfo; 
	  private Date cudate; 
	  private int cuprice;
	  private String[] files;
	  private String fullName;
	  private String mname;
	  private String maddr;
	  private String mtel;
	 
	  
	  public CustomVO() {
		
	}


	public CustomVO(int cuno, int sno, String cutitle, String cuinfo, Date cudate, int cuprice, String[] files,
			String fullName, String mname, String maddr, String mtel) {
		super();
		this.cuno = cuno;
		this.sno = sno;
		this.cutitle = cutitle;
		this.cuinfo = cuinfo;
		this.cudate = cudate;
		this.cuprice = cuprice;
		this.files = files;
		this.fullName = fullName;
		this.mname = mname;
		this.maddr = maddr;
		this.mtel = mtel;
	}


	public int getCuno() {
		return cuno;
	}


	public void setCuno(int cuno) {
		this.cuno = cuno;
	}


	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public String getCutitle() {
		return cutitle;
	}


	public void setCutitle(String cutitle) {
		this.cutitle = cutitle;
	}


	public String getCuinfo() {
		return cuinfo;
	}


	public void setCuinfo(String cuinfo) {
		this.cuinfo = cuinfo;
	}


	public Date getCudate() {
		return cudate;
	}


	public void setCudate(Date cudate) {
		this.cudate = cudate;
	}


	public int getCuprice() {
		return cuprice;
	}


	public void setCuprice(int cuprice) {
		this.cuprice = cuprice;
	}


	public String[] getFiles() {
		return files;
	}


	public void setFiles(String[] files) {
		this.files = files;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
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


	@Override
	public String toString() {
		return "CustomVO [cuno=" + cuno + ", sno=" + sno + ", cutitle=" + cutitle + ", cuinfo=" + cuinfo + ", cudate="
				+ cudate + ", cuprice=" + cuprice + ", files=" + Arrays.toString(files) + ", fullName=" + fullName
				+ ", mname=" + mname + ", maddr=" + maddr + ", mtel=" + mtel + "]";
	}


}
