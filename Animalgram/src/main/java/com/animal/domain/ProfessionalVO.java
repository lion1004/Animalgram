package com.animal.domain;

public class ProfessionalVO {
	private int pno; // ��������ȣ
	private int mno; // ȸ��DB(ȸ����ȣ)
	private String nickname;
	private String ptype; // ������ ����
	private String ptypeno; // ������ ��Ϲ�ȣ
	private String pcareer; // ���������
	private String pimage;																																																																																																																																																																																																																																																					
	private String date;
	
	@Override
	public String toString() {
		return "ProfessionalVO [pno=" + pno + ", mno=" + mno + ", nickname=" + nickname + ", ptype=" + ptype
				+ ", ptypeno=" + ptypeno + ", pcareer=" + pcareer + ", pimage=" + pimage + ", date=" + date + "]";
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPtypeno() {
		return ptypeno;
	}

	public void setPtypeno(String ptypeno) {
		this.ptypeno = ptypeno;
	}

	public String getPcareer() {
		return pcareer;
	}

	public void setPcareer(String pcareer) {
		this.pcareer = pcareer;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
