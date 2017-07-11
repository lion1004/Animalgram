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
	public void rinsert(ReplyVO vo) throws Exception {	// ��� �Է�
		dao.rinsert(vo);
	}

	@Override
	public void rupdate(ReplyVO vo) throws Exception {	// ��� ����
		dao.rupdate(vo);
	}

	@Override
	public void rremove(int arno) throws Exception {	// ��� ����
		dao.rremove(arno);
	}
	
	@Override
	public ReplyVO rread(int arno) throws Exception {	// ��� ���� �о����
		return dao.rread(arno);
	}

	@Override
	public List<ReplyVO> rlist(int antno, int start, int end) throws Exception {	// ��� ��� ���
		return dao.rlist(antno, start, end);
	}


	@Override
	public int rcount(int antno) throws Exception {		// ��� �� ���� ��������(����¡)
		return dao.rcount(antno);
	}
}