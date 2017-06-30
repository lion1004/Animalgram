package com.animal.service;

import java.util.List;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;

public interface AdminBoardService {
	public int todayBoard();

	public List<NoticeTextVO>listKnowhow(SearchCriteria cri);
	public int knowhowCount(SearchCriteria cri);
	
	public List<NoticeTextVO>listQuestion(SearchCriteria cri);
	public int questionCount(SearchCriteria cri);
	
	public int deleteBoard(List<Integer> list);
}
