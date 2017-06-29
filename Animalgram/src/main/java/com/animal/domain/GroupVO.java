package com.animal.domain;

import java.sql.Date;

public class GroupVO {
	private int gno; // 소모임번호
	private String gtitle; // 소모임제목
	private String gplace; // 소모임장소
	private String gdate; // 소모임일자
	private int gcount; // 소모임진행상태
	private int glimit; // 소모임참가제한인원
	private String gtype; // 소모임종류
	private String gstate; // 소모임진행상태
	private String gimage;
	private Date gwdate; // 소모임글등록일자

	@Override
	public String toString() {
		return "GroupVO [gno=" + gno + ", gtitle=" + gtitle + ", gplace=" + gplace + ", gdate=" + gdate + ", gcount="
				+ gcount + ", glimit=" + glimit + ", gtype=" + gtype + ", gstate=" + gstate + ", gimage=" + gimage
				+ ", gwdate=" + gwdate + "]";
	}

	public GroupVO() {
	}

	public GroupVO(int gno, String gtitle, String gplace, String gdate, int gcount, int glimit, String gtype,
			String gstate, String gimage, Date gwdate) {
		super();
		this.gno = gno;
		this.gtitle = gtitle;
		this.gplace = gplace;
		this.gdate = gdate;
		this.gcount = gcount;
		this.glimit = glimit;
		this.gtype = gtype;
		this.gstate = gstate;
		this.gimage = gimage;
		this.gwdate = gwdate;
	}

	public String getGimage() {
		return gimage;
	}

	public void setGimage(String gimage) {
		this.gimage = gimage;
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

	public int getGcount() {
		return gcount;
	}

	public void setGcount(int gcount) {
		this.gcount = gcount;
	}

	public Date getGwdate() {
		return gwdate;
	}

	public void setGwdate(Date gwdate) {
		this.gwdate = gwdate;
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

	public int getGlimit() {
		return glimit;
	}

	public void setGlimit(int glimit) {
		this.glimit = glimit;
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

	public String getGdate() {
		return gdate;
	}

	public void setGdate(String gdate) {
		this.gdate = gdate;
	}

}
