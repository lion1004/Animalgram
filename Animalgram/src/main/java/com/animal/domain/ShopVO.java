package com.animal.domain;

public class ShopVO {
	private int shno; // ¼¥¹øÈ£
	private String shtype; // ¼¥Á¾·ù
	private String shname; // ¼¥ÀÌ¸§
	private String shaddr; // ¼¥ÁÖ¼Ò
	private String shtel; // ¼¥ÀüÈ­¹øÈ£
	private String shtime; // ¼¥¿î¿µ½Ã°£
	private String shsite; // ¼¥À§Ä¡
	private String shparking; // ¼¥ÁÖÂ÷ÀåÀ¯¹«

	@Override
	public String toString() {
		return "ShopVO [shno=" + shno + ", shtype=" + shtype + ", shname=" + shname + ", shaddr=" + shaddr + ", shtel="
				+ shtel + ", shtime=" + shtime + ", shsite=" + shsite + ", shparking=" + shparking + "]";
	}

	public ShopVO() {
	}

	public ShopVO(int shno, String shtype, String shname, String shaddr, String shtel, String shtime, String shsite,
			String shparking) {
		super();
		this.shno = shno;
		this.shtype = shtype;
		this.shname = shname;
		this.shaddr = shaddr;
		this.shtel = shtel;
		this.shtime = shtime;
		this.shsite = shsite;
		this.shparking = shparking;
	}

	public int getShno() {
		return shno;
	}

	public void setShno(int shno) {
		this.shno = shno;
	}

	public String getShtype() {
		return shtype;
	}

	public void setShtype(String shtype) {
		this.shtype = shtype;
	}

	public String getShname() {
		return shname;
	}

	public void setShname(String shname) {
		this.shname = shname;
	}

	public String getShaddr() {
		return shaddr;
	}

	public void setShaddr(String shaddr) {
		this.shaddr = shaddr;
	}

	public String getShtel() {
		return shtel;
	}

	public void setShtel(String shtel) {
		this.shtel = shtel;
	}

	public String getShtime() {
		return shtime;
	}

	public void setShtime(String shtime) {
		this.shtime = shtime;
	}

	public String getShsite() {
		return shsite;
	}

	public void setShsite(String shsite) {
		this.shsite = shsite;
	}

	public String getShparking() {
		return shparking;
	}

	public void setShparking(String shparking) {
		this.shparking = shparking;
	}

}
