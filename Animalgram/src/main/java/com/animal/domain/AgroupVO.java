package com.animal.domain;

public class AgroupVO {

	private int gno;
	private String gtitle;
	private String gplace;
	private String gtype;
	private String gstate;
	
	@Override
	public String toString() {
		return "AgroupVO [gno=" + gno + ", gtitle=" + gtitle + ", gplace=" + gplace + ", gtype=" + gtype + ", gstate="
				+ gstate + "]";
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getGtitle() {
		return gtitle;
	}

	public void setGtitle(String gtitle) {
		this.gtitle = gtitle;
	}

	public String getGplace() {
		return gplace;
	}

	public void setGplace(String gplace) {
		this.gplace = gplace;
	}

	public String getGtype() {
		return gtype;
	}

	public void setGtype(String gtype) {
		this.gtype = gtype;
	}

	public String getGstate() {
		return gstate;
	}

	public void setGstate(String gstate) {
		this.gstate = gstate;
	}
	
} // class
