package com.animal.persistence;

import java.util.List;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.Criteria;

public interface CenterDAO {
	public int cinsert(CenterVO vo)throws Exception; // 고객센터 게시글 입력
	public CenterVO cread(int ctno)throws Exception;//고객센터 상세 글 보기
	public int cupdate(int ctno)throws Exception;//상태 업데이트
	public List<CenterReplyVO> creply(int ctno)throws Exception;
	public List<CenterVO> clist(Criteria cri)throws Exception;//고객센터 전체글 보기
	public int clistcount(Criteria cri)throws Exception;
}