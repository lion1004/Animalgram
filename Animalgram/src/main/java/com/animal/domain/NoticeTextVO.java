package com.animal.domain;

public class NoticeTextVO {
	private int antno; // ��ü �Խñ� ��ȣ
	private String nickname;// ȸ�� �г���
	private int nno; // �Խ���DB(�Խ��� ��ȣ)
	private int ntno; // �� �Խ��� �� �Խñ� ��ȣ
	private String ntitle; // �Խñ� ����
	private String ntcontent; // �Խñ� ����
	private String ntdate; // �Խñ� �������
	private String ntupdate;//�Խñ� ��������
	private int ncount;//��ȸ��
	
	public NoticeTextVO() {
	
	}

	@Override
	public String toString() {
		return "NoticeTextVO [antno=" + antno + ", nickname=" + nickname + ", nno=" + nno + ", ntno=" + ntno
				+ ", ntitle=" + ntitle + ", ntcontent=" + ntcontent + ", ntdate=" + ntdate + ", ntupdate=" + ntupdate
				+ ", ncount=" + ncount + "]";
	}

	public int getAntno() {
		return antno;
	}

	public void setAntno(int antno) {
		this.antno = antno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public int getNtno() {
		return ntno;
	}

	public void setNtno(int ntno) {
		this.ntno = ntno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNtcontent() {
		return ntcontent;
	}

	public void setNtcontent(String ntcontent) {
		this.ntcontent = ntcontent;
	}

	public String getNtdate() {
		return ntdate;
	}

	public void setNtdate(String ntdate) {
		this.ntdate = ntdate;
	}

	public String getNtupdate() {
		return ntupdate;
	}

	public void setNtupdate(String ntupdate) {
		this.ntupdate = ntupdate;
	}

	public int getNcount() {
		return ncount;
	}

	public void setNcount(int ncount) {
		this.ncount = ncount;
	}
	
}