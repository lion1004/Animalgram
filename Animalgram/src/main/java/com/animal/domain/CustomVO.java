package com.animal.domain;

import java.sql.Date;

public class CustomVO {
	private int cuno; // 주문제작번호
	private int sno; // 판매자DB(판매자번호)
	private String ctitle; // 글제목
	private int cprice; // 가격
	private String cimage; // 주문제작물품이미지
	private String cinfo; // 품목정보
	private Date cdate; // 주문제작 게시글 올린 일자

	@Override
	public String toString() {
		return "CustomVO [cuno=" + cuno + ", sno=" + sno + ", ctitle=" + ctitle + ", cprice=" + cprice + ", cimage="
				+ cimage + ", cinfo=" + cinfo + ", cdate=" + cdate + "]";
	}

	public CustomVO() {
	}

	public CustomVO(int cuno, int sno, String ctitle, int cprice, String cimage, String cinfo, Date cdate) {
		super();
		this.cuno = cuno;
		this.sno = sno;
		this.ctitle = ctitle;
		this.cprice = cprice;
		this.cimage = cimage;
		this.cinfo = cinfo;
		this.cdate = cdate;
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

	public int getCprice() {
		return cprice;
	}

	public void setCprice(int cprice) {
		this.cprice = cprice;
	}

	public String getCimage() {
		return cimage;
	}

	public void setCimage(String cimage) {
		this.cimage = cimage;
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

}
