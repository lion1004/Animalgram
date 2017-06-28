package com.animal.domain;

import java.sql.Date;

public class GroupVO {
	private int gno; // 소모임번호
	private String gtitle; // 소모임제목
	private String gplace; // 소모임장소
	private int glimit; // 소모임참가제한인원
	private String gtype; // 소모임종류
	private String gstate; // 소모임진행상태
	private Date gdate; // 소모임글등록일자

	@Override
	public String toString() {
		return "GroupVO [gno=" + gno + ", gtitle=" + gtitle + ", gplace=" + gplace + ", glimit=" + glimit + ", gtype="
				+ gtype + ", gstate=" + gstate + ", gdate=" + gdate + "]";
	}

	public GroupVO() {
	}

	public GroupVO(int gno, String gtitle, String gplace, int glimit, String gtype, String gstate, Date gdate) {
		super();
		this.gno = gno;
		this.gtitle = gtitle;
		this.gplace = gplace;
		this.glimit = glimit;
		this.gtype = gtype;
		this.gstate = gstate;
		this.gdate = gdate;
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

	public Date getGdate() {
		return gdate;
	}

	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}

}
