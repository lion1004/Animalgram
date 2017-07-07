package com.animal.service;

import java.util.List;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.SearchCriteria;

public interface AdminCenterService {
	
	public List<CenterVO> listCenter(SearchCriteria cri);
	public int centerCount(SearchCriteria cri);
	
	public CenterVO selectCenter(int ctno);
	public int deleteCenter(int ctno);
	
	public List<CenterReplyVO> selectReply(int ctno);
	
	public int insertReply(CenterReplyVO vo);
	public int updateReply(CenterReplyVO vo);
	public int deleteReply(int ctno);
	
	public void deleteAllCenter(int ctno);
}
