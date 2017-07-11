package com.animal.domain;

public class ShopVO {

	private String shtype;
	private String shname;
	private String shaddr;
	private String shtel;
	private String shtime;
	private String shsite;
	private String shparking;
	private int shno;
	
	
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
	public int getShno() {
		return shno;
	}
	public void setShno(int shno) {
		this.shno = shno;
	}
	@Override
	public String toString() {
		return "Shop [shno=" + shno + ", shtype=" + shtype + ", shname=" + shname + ", shaddr=" + shaddr + ", shtel="
				+ shtel + ", shtime=" + shtime + ", shsite=" + shsite + ", shparking=" + shparking + "]";
	}
	
	
	
}//class


