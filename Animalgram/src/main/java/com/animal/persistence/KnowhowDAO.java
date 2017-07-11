package com.animal.persistence;

import java.util.List;
import java.util.Map;


import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;


public interface KnowhowDAO {
	public int kinsert(NoticeTextVO vo)throws Exception;//게시글 추가
	public void kupdate(NoticeTextVO vo)throws Exception;//게시글 수정
	public void kremove(Map<String, Object> map)throws Exception;//게시글 한행 삭제
	
	public NoticeTextVO kread(Map<String, Object> map)throws Exception;//게시글 한행 검색
	
	public List<NoticeTextVO> klist(SearchCriteria cri) throws Exception;//전체 리스트 출력
	public int klistcount(SearchCriteria cri)throws Exception;// 전체 게시글 갯수 
	
	public void kcount(Map<String, Object> map) throws Exception;	// 조회수 중복방지
}
