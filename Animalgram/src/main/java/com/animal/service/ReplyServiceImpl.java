package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.ReplyVO;
import com.animal.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public void rinsert(ReplyVO vo) throws Exception {	// ´ñ±Û ÀÔ·Â
		dao.rinsert(vo);
	}

	@Override
	public void rupdate(ReplyVO vo) throws Exception {	// ´ñ±Û ¼öÁ¤
		dao.rupdate(vo);
	}

	@Override
	public void rremove(int arno) throws Exception {	// ´ñ±Û »èÁ¦
		dao.rremove(arno);
	}
	
	@Override
	public ReplyVO rread(int arno) throws Exception {	// ´ñ±Û ÇÑÁÙ ÀÐ¾î¿À±â
		return dao.rread(arno);
	}

	@Override
	public List<ReplyVO> rlist(int antno, int start, int end) throws Exception {	// ´ñ±Û ¸ñ·Ï Ãâ·Â
		return dao.rlist(antno, start, end);
	}


	@Override
	public int rcount(int antno) throws Exception {		// ´ñ±Û ÃÑ °¹¼ö °¡Á®¿À±â(ÆäÀÌÂ¡)
		return dao.rcount(antno);
	}
}