package com.animal.service;

import java.util.List;

import com.animal.domain.ReplyVO;

public interface ReplyService {
	public void rinsert(ReplyVO vo) throws Exception;		// ´ñ±Û Ãß°¡
	public void rupdate(ReplyVO vo) throws Exception;		// ´ñ±Û ¼öÁ¤
	public void rremove(int arno) throws Exception;			// ´ñ±Û »èÁ¦
	
	public ReplyVO rread(int arno) throws Exception;		// ´ñ±Û ÇÏ³ª ÀÐ¾î¿À±â
	
	public List<ReplyVO> rlist(int antno, int start, int end) throws Exception;		// ´ñ±Û ¸ñ·Ï Ãâ·Â
	
	public int rcount(int antno) throws Exception;			// ´ñ±Û ÃÑ °¹¼ö
}