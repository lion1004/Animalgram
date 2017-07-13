package com.animal.domain;

public class DonationCheckVO {

	private int dano;	// 당첨자 번호
	private String dtitle;	// 나눔 제목
	private String dinfo;	// 나눔 정보
	private String damemo;	// 신청 메모
	private String dastate;	// 신청 상태
	private String maddr;	// 신청자 주소
	
	public DonationCheckVO() {
	
	}

	@Override
	public String toString() {
		return "DonationCheckVO [dano=" + dano + ", dtitle=" + dtitle + ", dinfo=" + dinfo + ", damemo=" + damemo
				+ ", dastate=" + dastate + ", maddr=" + maddr + "]";
	}

	public int getDano() {
		return dano;
	}

	public void setDano(int dano) {
		this.dano = dano;
	}

	public String getDtitle() {
		return dtitle;
	}

	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}

	public String getDinfo() {
		return dinfo;
	}

	public void setDinfo(String dinfo) {
		this.dinfo = dinfo;
	}

	public String getDamemo() {
		return damemo;
	}

	public void setDamemo(String damemo) {
		this.damemo = damemo;
	}

	public String getDastate() {
		return dastate;
	}

	public void setDastate(String dastate) {
		this.dastate = dastate;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	
} // class
