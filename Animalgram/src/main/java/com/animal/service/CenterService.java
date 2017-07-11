package com.animal.service;

import java.util.List;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.Criteria;

public interface CenterService {
	public int cinsert(CenterVO vo) throws Exception;	// 고객센터 게시글 입력
	public CenterVO cread(int ctno)throws Exception;//고객센터 게시글 상세 보기
	public  List<CenterReplyVO> creply(int ctno)throws Exception;
	public List<CenterVO> clist(Criteria cri)throws Exception;// 고객센터 게시글 전체 보기
	public int clistcount(Criteria cri) throws Exception;
}
