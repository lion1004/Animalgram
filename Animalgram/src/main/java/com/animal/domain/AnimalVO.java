package com.animal.domain;

import java.sql.Date;

public class AnimalVO {
	private int ano; // �ݷ�������ȣ
	private int mno; // ȸ��DB(ȸ����ȣ)
	private String nickname;
	private String aname; // �ݷ������̸�
	private String agender; // �ݷ���������
	private int aage; // �ݷ���������
	private String atype; // �ݷ����� ����
	private String aimage; // �ݷ������̹���
	private Date adate; // �ݷ����� ��� ����
	
	@Override
	public String toString() {
		return "AnimalVO [ano=" + ano + ", mno=" + mno + ", nickname=" + nickname + ", aname=" + aname + ", agender="
				+ agender + ", aage=" + aage + ", atype=" + atype + ", aimage=" + aimage + ", adate=" + adate + "]";
	}
	
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
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
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAgender() {
		return agender;
	}
	public void setAgender(String agender) {
		this.agender = agender;
	}
	public int getAage() {
		return aage;
	}
	public void setAage(int aage) {
		this.aage = aage;
	}
	public String getAtype() {
		return atype;
	}
	public void setAtype(String atype) {
		this.atype = atype;
	}
	public String getAimage() {
		return aimage;
	}
	public void setAimage(String aimage) {
		this.aimage = aimage;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
}
