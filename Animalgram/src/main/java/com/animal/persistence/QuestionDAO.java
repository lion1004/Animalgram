package com.animal.persistence;

import java.util.List;
import java.util.Map;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;


public interface QuestionDAO {
	public int qinsert(NoticeTextVO vo)throws Exception;	//게시글 추가
	public void qupdate(NoticeTextVO vo)throws Exception;	//게시글 수정
	public void qremove(Map<String, Object> map)throws Exception;	//게시글 한행 삭제
	
	public NoticeTextVO qread(Map<String, Object> map)throws Exception;	//게시글 한행 검색
	
	public List<NoticeTextVO> qlist(SearchCriteria cri) throws Exception;	//전체 리스트 출력
	public int qlistcount(SearchCriteria cri)throws Exception;	// 전체 게시글 갯수 
	
	public void qcount(Map<String, Object> map) throws Exception;	// 조회수 중복방지
}
