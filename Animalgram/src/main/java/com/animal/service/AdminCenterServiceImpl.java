package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.AdminCenterDAO;

@Service
public class AdminCenterServiceImpl implements AdminCenterService{

	@Inject
	AdminCenterDAO dao;
	
	public List<CenterVO> listCenter(SearchCriteria cri) {
		return dao.listCenter(cri);
	}

	public int centerCount(SearchCriteria cri) {
		return dao.centerCount(cri);
	}

	public CenterVO selectCenter(int ctno) {
		return dao.selectCenter(ctno);
	}

	public List<CenterReplyVO> selectReply(int ctno) {
		return dao.selectReply(ctno);
	}

	public int deleteCenter(int ctno) {
		return dao.deleteCenter(ctno);
	}

	public int insertReply(CenterReplyVO vo) {
		return dao.insertReply(vo);
	}

	public int updateReply(CenterReplyVO vo) {
		return dao.updateReply(vo);
	}

	public int deleteReply(int ctno) {
		return dao.deleteReply(ctno);
	}
	
	public void deleteAllCenter(int ctno) {
		dao.deleteReply(ctno);
		dao.deleteCenter(ctno);
	}
	

}
