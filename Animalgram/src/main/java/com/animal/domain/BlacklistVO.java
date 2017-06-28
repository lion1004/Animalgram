package com.animal.domain;

import java.sql.Date;

public class BlacklistVO {
	private int lno; // 블랙리스트번호
	private int mno; // 회원DB(회원정보)
	private String lcause; // 블랙리스트 사유
	private Date ldate; // 블랙리스트 등록일자

	@Override
	public String toString() {
		return "BlacklistVO [lno=" + lno + ", mno=" + mno + ", lcause=" + lcause + ", ldate=" + ldate + "]";
	}

	public BlacklistVO() {
	}

	public BlacklistVO(int lno, int mno, String lcause, Date ldate) {
		super();
		this.lno = lno;
		this.mno = mno;
		this.lcause = lcause;
		this.ldate = ldate;
	}

	public int getLno() {
		return lno;
	}

	public void setLno(int lno) {
		this.lno = lno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getLcause() {
		return lcause;
	}

	public void setLcause(String lcause) {
		this.lcause = lcause;
	}

	public Date getLdate() {
		return ldate;
	}

	public void setLdate(Date ldate) {
		this.ldate = ldate;
	}

}
