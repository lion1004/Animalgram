package com.animal.persistence;

import java.util.List;

import com.animal.domain.ReplyVO;

public interface ReplyDAO {
	public void rinsert(ReplyVO vo) throws Exception;	// 댓글추가
	public void rupdate(ReplyVO vo) throws Exception;	// 댓글 수정
	public void rremove(int arno) throws Exception;		// 댓글 삭제
	
	public ReplyVO rread(int arno) throws Exception;	// 댓글 한 줄 읽어오기
	
	public List<ReplyVO> rlist(int antno,int start, int end) throws Exception;	// 댓글 목록 출력
	public int rcount(int antno) throws Exception;		// 댓글 전체 갯수(페이징)
}
