package com.animal.domain;

public class CareProVO {

	private int cano;
	private int cno;
	private String ctype;
	private String ccontent;
	private String nickname;
	private String cadate;
	private String castate;
	
	public CareProVO() {
	}
	
	@Override
	public String toString() {
		return "CareProVO [cano=" + cano + ", cno=" + cno + ", ctype=" + ctype + ", ccontent=" + ccontent
				+ ", nickname=" + nickname + ", cadate=" + cadate + ", castate=" + castate + "]";
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	
} // class
