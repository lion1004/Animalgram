package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.AdminBoardDAO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Inject
	AdminBoardDAO dao;
	
	@Override
	public int todayBoard() {
		return dao.todayBoard();
	}

	public List<NoticeTextVO> listKnowhow(SearchCriteria cri) {
		return dao.listKnowhow(cri);
	}

	public int knowhowCount(SearchCriteria cri) {
		return dao.knowhowCount(cri);
	}

	public List<NoticeTextVO> listQuestion(SearchCriteria cri) {
		return dao.listQuestion(cri);
	}

	@Override
	public int questionCount(SearchCriteria cri) {
		return dao.questionCount(cri);
	}

	@Override
	public int deleteBoard(List<Integer> list) {
		return dao.deleteBoard(list);
	}

}
