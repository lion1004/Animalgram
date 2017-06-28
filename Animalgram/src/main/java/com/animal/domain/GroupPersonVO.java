package com.animal.domain;

public class GroupPersonVO {
	private int gpno; // �Ҹ��������ڹ�ȣ
	private int mno; // ȸ��DB(ȸ����ȣ)
	private int ano; // �ݷ�����DB(�ݷ�������ȣ)
	private int gno; // �Ҹ���DB(�Ҹ��ӹ�ȣ)

	@Override
	public String toString() {
		return "GroupPersonVo [gpno=" + gpno + ", mno=" + mno + ", ano=" + ano + ", gno=" + gno + "]";
	}

	public GroupPersonVO() {
	}

	public GroupPersonVO(int gpno, int mno, int ano, int gno) {
		super();
		this.gpno = gpno;
		this.mno = mno;
		this.ano = ano;
		this.gno = gno;
	}

	public int getGpno() {
		return gpno;
	}

	public void setGpno(int gpno) {
		this.gpno = gpno;
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

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

}
