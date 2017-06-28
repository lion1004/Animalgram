package com.animal.domain;

import java.sql.Date;

public class GroupVO {
	private int gno; // �Ҹ��ӹ�ȣ
	private String gtitle; // �Ҹ�������
	private String gplace; // �Ҹ������
	private int glimit; // �Ҹ������������ο�
	private String gtype; // �Ҹ�������
	private String gstate; // �Ҹ����������
	private Date gdate; // �Ҹ��ӱ۵������

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
