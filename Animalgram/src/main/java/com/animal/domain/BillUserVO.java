package com.animal.domain;

public class BillUserVO {

	private int bno;	// �ֹ��� ��ȣ
	private String cutitle;	// ��ǰ����
	private String cuinfo;	// ��ǰ����
	private int bcount;		// ����
	private int cuprice;	// ����
	private String bstate;	// �ֹ� ����
	
	public BillUserVO() {
	
	}

	@Override
	public String toString() {
		return "BillUserVO [bno=" + bno + ", cutitle=" + cutitle + ", cuinfo=" + cuinfo + ", bcount=" + bcount
				+ ", cuprice=" + cuprice + ", bstate=" + bstate + "]";
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getCutitle() {
		return cutitle;
	}

	public void setCutitle(String cutitle) {
		this.cutitle = cutitle;
	}

	public String getCuinfo() {
		return cuinfo;
	}

	public void setCuinfo(String cuinfo) {
		this.cuinfo = cuinfo;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public int getCuprice() {
		return cuprice;
	}

	public void setCuprice(int cuprice) {
		this.cuprice = cuprice;
	}

	public String getBstate() {
		return bstate;
	}

	public void setBstate(String bstate) {
		this.bstate = bstate;
	}
	
} // class
