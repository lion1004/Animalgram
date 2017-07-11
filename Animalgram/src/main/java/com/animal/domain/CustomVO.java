package com.animal.domain;

import java.util.Arrays;
import java.util.Date;

public class CustomVO {
	
	  private int cuno; 
	  private int sno; 
	  private String ctitle;
	private String cprice;
	  private String cutitle; 
	  private String cinfo; 
	  private Date cdate; 
	  private String[] files;
	  private String fullName;
	  private String mname;
	  private String maddr;
	  private String mtel;
	  private int bsellcount;
	  
	  public CustomVO() {
		
	}

	@Override
	public String toString() {
		return "CustomVO [cuno=" + cuno + ", sno=" + sno + ", ctitle=" + ctitle + ", cprice=" + cprice + ", cutitle="
				+ cutitle + ", cinfo=" + cinfo + ", cdate=" + cdate + ", files=" + Arrays.toString(files)
				+ ", fullName=" + fullName + ", mname=" + mname + ", maddr=" + maddr + ", mtel=" + mtel
				+ ", bsellcount=" + bsellcount + "]";
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

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getCprice() {
		return cprice;
	}

	public void setCprice(String cprice) {
		this.cprice = cprice;
	}

	public String getCutitle() {
		return cutitle;
	}

	public void setCutitle(String cutitle) {
		this.cutitle = cutitle;
	}

	public String getCinfo() {
		return cinfo;
	}

	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
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

	public int getBsellcount() {
		return bsellcount;
	}

	public void setBsellcount(int bsellcount) {
		this.bsellcount = bsellcount;
	}
	  

}
