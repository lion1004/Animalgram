package com.animal.domain;

public class CareVO {
	private int cno; // �Ʒù�ȣ
	private int pno; // ��������ȣ
	private String ctype; // �Ʒ�����
	private String ccontent; // �Ʒó���

	@Override
	public String toString() {
		return "CareVO [cno=" + cno + ", pno=" + pno + ", ctype=" + ctype + ", ccontent=" + ccontent + "]";
	}

	public CareVO() {
	}

	public CareVO(int cno, int pno, String ctype, String ccontent) {
		super();
		this.cno = cno;
		this.pno = pno;
		this.ctype = ctype;
		this.ccontent = ccontent;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

}
