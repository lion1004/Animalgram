package com.animal.domain;

public class CareAskVO {
	private int cano; //�Ʒý�û��ȣ
	private int cno; //�Ʒù�ȣ
	private int mno; //�Ʒù�ȣ
	private int ano; //�� ��ȣ
	private String cadate; //�Ʒ�����
	private String castate; //�Ʒû���

	
	
	@Override
	public String toString() {
		return "CareAskVO [cano=" + cano + ", cno=" + cno + ", mno=" + mno + ", ano=" + ano + ", cadate=" + cadate
				+ ", castate=" + castate + "]";
	}



	public CareAskVO() {
	}



	public CareAskVO(int cano, int cno, int mno, int ano, String cadate, String castate) {
		super();
		this.cano = cano;
		this.cno = cno;
		this.mno = mno;
		this.ano = ano;
		this.cadate = cadate;
		this.castate = castate;
	}



	public int getCano() {
		return cano;
	}



	public void setCano(int cano) {
		this.cano = cano;
	}



	public int getCno() {
		return cno;
	}



	public void setCno(int cno) {
		this.cno = cno;
	}



	public int getMno() {
		return mno;
	}



	public void setMno(int mno) {
		this.mno = mno;
	}



	public int getAno() {
		return ano;
	}



	public void setAno(int ano) {
		this.ano = ano;
	}



	public String getCadate() {
		return cadate;
	}



	public void setCadate(String cadate) {
		this.cadate = cadate;
	}



	public String getCastate() {
		return castate;
	}



	public void setCastate(String castate) {
		this.castate = castate;
	}
	
	
}
