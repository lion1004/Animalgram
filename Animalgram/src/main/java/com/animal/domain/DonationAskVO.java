package com.animal.domain;

import java.sql.Date;

public class DonationAskVO {
	private int dano; // 나눔신청서번호
	private int dno; // 나눔DB(나눔번호)
	private int mno; // 회원DB(회원번호)
	private String damemo; // 나눔신청서 메모
	private String dadeli; // 나눔 받을 주소
	private Date dadate; // 나눔신청일자

	@Override
	public String toString() {
		return "DonationAskVO [dano=" + dano + ", dno=" + dno + ", mno=" + mno + ", damemo=" + damemo + ", dadeli="
				+ dadeli + ", dadate=" + dadate + "]";
	}

	public DonationAskVO() {
	}

	public DonationAskVO(int dano, int dno, int mno, String damemo, String dadeli, Date dadate) {
		super();
		this.dano = dano;
		this.dno = dno;
		this.mno = mno;
		this.damemo = damemo;
		this.dadeli = dadeli;
		this.dadate = dadate;
	}

	public int getDano() {
		return dano;
	}

	public void setDano(int dano) {
		this.dano = dano;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getDamemo() {
		return damemo;
	}

	public void setDamemo(String damemo) {
		this.damemo = damemo;
	}

	public String getDadeli() {
		return dadeli;
	}

	public void setDadeli(String dadeli) {
		this.dadeli = dadeli;
	}

	public Date getDadate() {
		return dadate;
	}

	public void setDadate(Date dadate) {
		this.dadate = dadate;
	}

}
