package com.animal.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker { //페이징에 관련된 속성 저장
	private int totalCount; //전체 레코드 수
	private int startPage;  //현페이지 13, startPage 11
	private int endPage;    //현페이지 13, endPage 20
	private boolean prev; //<<
	private boolean next; //>>
	
	private int displayPageNum = 10;//화면에 보여줄 번호의 묶음 단위
	/*
	  10 ---> 1 2 3 4 5 6 7 8 9 10   현페이지 3일 경우
	  20 ---> 11 12 13 14 15 16 17 18 19 20   현페이지 19일 경우
	 */
	
	private Criteria cri;
	
	public void setCri(Criteria cri){
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public void calcData(){
		endPage = (int)(Math.ceil(cri.getPage() /
				  (double) displayPageNum) * displayPageNum);
	    startPage = (endPage - displayPageNum) + 1;
	    
	    int tempEndPage = (int)(Math.ceil(totalCount /
	    		(double) cri.getPerPageNum()));
	    //전체 페이지 수
	    if(endPage > tempEndPage){
	    	endPage = tempEndPage;
	    }
	    prev = startPage == 1 ? false : true;
	    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	    
	}
	
	public String makeQuery(int page){ //쿼리 생성  ?page=3&perPageNum=10
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page){ //쿼리 생성
		String keyword = encoding(((SearchCriteria)cri).getKeyword());
		
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType",((SearchCriteria)cri).getSearchType())
				.queryParam("keyword",keyword)
				.build();
		
		return uriComponents.toUriString();
	}
	
	public String modifymakeQuery(){
		
		UriComponents uriComponents=
				UriComponentsBuilder.newInstance()
				.queryParam("shno=")
				.build();
		
		return uriComponents.toUriString();//"?page=1&perPageNum=5"
	}//수정 페이지 쿼리문만드는
	public String deletemakeQuery(){
		
		UriComponents uriComponents=
				UriComponentsBuilder.newInstance()
				.queryParam("shno=")
				.build();
		
		return uriComponents.toUriString();//?shno=
	}//삭제쿼리문만드는
	
	
	
	private String encoding(String keyword){
		if(keyword == null || keyword.trim().length() == 0){
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}
	
}
