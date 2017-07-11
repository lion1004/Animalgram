package com.animal.domain;

import java.util.Arrays;
import java.util.Date;

public class CustomVO {
	
	  private int cuno; 
	  private int sno; 
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

	public CustomVO(int cuno, int sno, String cutitle, String cinfo, Date cdate, String[] files, String fullName,
			String mname, String maddr, String mtel) {
		super();
		this.cuno = cuno;
		this.sno = sno;
		this.cutitle = cutitle;
		this.cinfo = cinfo;
		this.cdate = cdate;
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

	@Override
	public String toString() {
		return "CustomVO [cuno=" + cuno + ", sno=" + sno + ", cutitle=" + cutitle + ", cinfo=" + cinfo + ", cdate="
				+ cdate + ", files=" + Arrays.toString(files) + ", fullName=" + fullName + ", mname=" + mname
				+ ", maddr=" + maddr + ", mtel=" + mtel + ", bsellcount=" + bsellcount + "]";
	}
	
   
}
