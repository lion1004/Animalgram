package com.animal.domain;

import java.sql.Date;

public class MemberVO {
	
	private int mno;			// ȸ����ȣ
	private String idmail;		// ȸ�����̵�
	private String mpass;		// ��й�ȣ
	private String nickname;	// �г���
	private String mname;		// �̸�
	private String birth;		// �������
	private String mgender;		// ����
	private String job;			// ����
	private String mtel;		// ��ȭ��ȣ
	private String maddr;		// �ּ�
	private String favorite;	// ���ɺо� ( �����,������ )
	private String pwcode;		// �����ڵ�
	private String pwcodeas;	// �����ڵ� �亯
	private String mdate;		// ��������
	
	private boolean listCheck = false; 
	//������������ ������Ʈ üũ�� 

	@Override
	public String toString() {
		return "MemberVO [mno=" + mno + ", idmail=" + idmail + ", mpass=" + mpass + ", nickname=" + nickname
				+ ", mname=" + mname + ", birth=" + birth + ", mgender=" + mgender + ", job=" + job + ", mtel=" + mtel
				+ ", maddr=" + maddr + ", favorite=" + favorite + ", pwcode=" + pwcode + ", pwcodeas=" + pwcodeas
				+ ", mdate=" + mdate + ", listCheck=" + listCheck + "]";
	}

	public String getPwcode() {
		return pwcode;
	}

	public String getMdate() {
		return mdate;
	}

	public void setPwcode(String pwcode) {
		this.pwcode = pwcode;
	}

	public String getPwcodeas() {
		return pwcodeas;
	}

	public void setPwcodeas(String pwcodeas) {
		this.pwcodeas = pwcodeas;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public boolean isListCheck() {
		return listCheck;
	}

	public void setListCheck(boolean listCheck) {
		this.listCheck = listCheck;
	}

	public MemberVO() {
	}

	
	public MemberVO(int mno, String idmail, String mpass, String nickname, String mname, String birth, String mgender,
			String job, String mtel, String maddr, String favorite, String pwcode, String pwcodeas, String mdate,
			boolean listCheck) {
		super();
		this.mno = mno;
		this.idmail = idmail;
		this.mpass = mpass;
		this.nickname = nickname;
		this.mname = mname;
		this.birth = birth;
		this.mgender = mgender;
		this.job = job;
		this.mtel = mtel;
		this.maddr = maddr;
		this.favorite = favorite;
		this.pwcode = pwcode;
		this.pwcodeas = pwcodeas;
		this.mdate = mdate;
		this.listCheck = listCheck;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getIdmail() {
		return idmail;
	}

	public void setIdmail(String idmail) {
		this.idmail = idmail;
	}

	public String getMpass() {
		return mpass;
	}

	public void setMpass(String mpass) {
		this.mpass = mpass;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getFavorite() {
		return favorite;
	}

	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}

}
