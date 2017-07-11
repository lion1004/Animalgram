package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.Criteria;
import com.animal.persistence.CenterDAO;

@Service
public class CenterServiceImpl implements CenterService {

	@Inject
	private CenterDAO dao;
	
	@Override
	public int cinsert(CenterVO vo) throws Exception { // 고객센터 게시글 입력
		return dao.cinsert(vo);
	}
	
	@Override
	public CenterVO cread(int ctno) throws Exception{ //고객센터 상세 글보기
		return dao.cread(ctno);
	}

	@Override
	public List<CenterReplyVO> creply(int ctno) throws Exception {
		return dao.creply(ctno);
	}
	
	@Override
	public List<CenterVO> clist(Criteria cri)throws Exception {// 고객센터 전체글 보기
		return dao.clist(cri);
	}
	
	@Override
	public int clistcount(Criteria cri) throws Exception {
		return dao.clistcount(cri);

	}


}
