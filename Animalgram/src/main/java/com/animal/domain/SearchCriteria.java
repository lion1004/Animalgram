package com.animal.domain;

public class SearchCriteria extends Criteria{
	//�˻� ���� �Ӽ�
	private String searchType; //�޺��ڽ� ����
	private String keyword;    //�Էµ� �˻���
	
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
