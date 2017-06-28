package com.animal.domain;

public class FastqaVO {
	private int faqno; // FAQ번호
	private String faqtitle; // FAQ제목
	private String faqcontent; // FAQ내용
	private String faqreply; // FAQ답글

	@Override
	public String toString() {
		return "FastqaVO [faqno=" + faqno + ", faqtitle=" + faqtitle + ", faqcontent=" + faqcontent + ", faqreply="
				+ faqreply + "]";
	}

	public FastqaVO() {
	}

	public FastqaVO(int faqno, String faqtitle, String faqcontent, String faqreply) {
		super();
		this.faqno = faqno;
		this.faqtitle = faqtitle;
		this.faqcontent = faqcontent;
		this.faqreply = faqreply;
	}

	public int getFaqno() {
		return faqno;
	}

	public void setFaqno(int faqno) {
		this.faqno = faqno;
	}

	public String getFaqtitle() {
		return faqtitle;
	}

	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}

	public String getFaqcontent() {
		return faqcontent;
	}

	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}

	public String getFaqreply() {
		return faqreply;
	}

	public void setFaqreply(String faqreply) {
		this.faqreply = faqreply;
	}

}
