package com.animal.domain;

import java.sql.Date;

public class MemberVO {
	private int mno; // 회원번호
	private String idmail; // 회원아이디(이메일)
	private String mpass; // 비밀번호
	private String mhint; // 비밀힌트
	private String nickname; // 닉네임
	private String mname; // 이름
	private String birth; // 생년월일
	private String mgender; // 성별
	private String job; // 직업
	private String mtel; // 전화번호
	private String maddr; // 사는지역
	private String favorite; // 관심분야
	private Date mdate; // 가입일자
	
	private boolean listCheck = false; 
	//관리자페이지 블랙리스트 체크용 

	@Override
	public String toString() {
		return "MemberVO [mno=" + mno + ", idmail=" + idmail + ", mpass=" + mpass + ", mhint=" + mhint + ", nickname="
				+ nickname + ", mname=" + mname + ", birth=" + birth + ", mgender=" + mgender + ", job=" + job
				+ ", mtel=" + mtel + ", maddr=" + maddr + ", favorite=" + favorite + ", mdate=" + mdate + ", listCheck="
				+ listCheck + "]";
	}

	public boolean isListCheck() {
		return listCheck;
	}

	public void setListCheck(boolean listCheck) {
		this.listCheck = listCheck;
	}

	public MemberVO() {
	}


	public MemberVO(int mno, String idmail, String mpass, String mhint, String nickname, String mname, String birth,
			String mgender, String job, String mtel, String maddr, String favorite, Date mdate) {
		super();
		this.mno = mno;
		this.idmail = idmail;
		this.mpass = mpass;
		this.mhint = mhint;
		this.nickname = nickname;
		this.mname = mname;
		this.birth = birth;
		this.mgender = mgender;
		this.job = job;
		this.mtel = mtel;
		this.maddr = maddr;
		this.favorite = favorite;
		this.mdate = mdate;
	}

	
	public String getMhint() {
		return mhint;
	}

	public void setMhint(String mhint) {
		this.mhint = mhint;
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

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}


}
