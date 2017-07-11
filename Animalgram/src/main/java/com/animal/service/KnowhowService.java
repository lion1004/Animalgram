package com.animal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;

public interface KnowhowService {
	public int kinsert(NoticeTextVO vo)throws Exception;			// 게시글 작성
	public void kupdate(NoticeTextVO vo)throws Exception;			// 게시글 수정
	public void kremove(Map<String, Object> map)throws Exception;	// 게시글 삭제
	
	public NoticeTextVO kread(Map<String, Object> map)throws Exception;		// 게시글 하나 읽어오기
	public void kcount(Map<String, Object> map, HttpSession session) throws Exception;	// 게시글 조회수(중복방지)
	
	public List<NoticeTextVO> klist(SearchCriteria cri) throws Exception;	// 게시글 목록
	public int klistcount(SearchCriteria cri) throws Exception;		// 게시글 총 갯수(페이징)
}