package com.animal.domain;

public class SearchCriteria extends Criteria{
	//검색 관련 속성
	private String searchType; //콤보박스 선택
	private String keyword;    //입력된 검색어
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return super.toString()+":: SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
