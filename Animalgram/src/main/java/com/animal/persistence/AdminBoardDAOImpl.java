package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;

@Repository
public class AdminBoardDAOImpl implements AdminBoardDAO{

	@Inject
	SqlSession session;
	
	public int todayBoard() {
		return session.selectOne("adminBoard.todayBoard");
	}

	public List<NoticeTextVO> listKnowhow(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return session.selectList("adminBoard.listKnowhow",cri,row);
	}
	
	public int knowhowCount(SearchCriteria cri) {
		return session.selectOne("adminBoard.knowhowCount",cri);
	}

	public List<NoticeTextVO> listQuestion(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return session.selectList("adminBoard.listQuestion",cri,row);
	}

	public int questionCount(SearchCriteria cri) {
		return session.selectOne("adminBoard.questionCount",cri);
	}

	@Override
	public int deleteBoard(List<Integer> list) {
		return session.delete("adminBoard.deleteBoard",list);
	}


}
