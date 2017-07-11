package com.animal.service;

import java.util.List;

import com.animal.domain.ReplyVO;

public interface ReplyService {
	public void rinsert(ReplyVO vo) throws Exception;		// ��� �߰�
	public void rupdate(ReplyVO vo) throws Exception;		// ��� ����
	public void rremove(int arno) throws Exception;			// ��� ����
	
	public ReplyVO rread(int arno) throws Exception;		// ��� �ϳ� �о����
	
	public List<ReplyVO> rlist(int antno, int start, int end) throws Exception;		// ��� ��� ���
	
	public int rcount(int antno) throws Exception;			// ��� �� ����
}