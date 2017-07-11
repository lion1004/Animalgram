package com.animal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;

public interface QuestionService {
	public int qinsert(NoticeTextVO vo)throws Exception;			// 게시글 작성
	public void qupdate(NoticeTextVO vo)throws Exception;			// 게시글 수정
	public void qremove(Map<String, Object> map)throws Exception;	// 게시글 삭제
	
	public NoticeTextVO qread(Map<String, Object> map)throws Exception;		// 게시글 하나 읽어오기
	public void qcount(Map<String, Object> map, HttpSession session) throws Exception;	// 게시글 조회수(중복방지)
	
	public List<NoticeTextVO> qlist(SearchCriteria cri) throws Exception;	// 게시글 목록
	public int qlistcount(SearchCriteria cri) throws Exception;		// 게시글 총 갯수(페이징)
}