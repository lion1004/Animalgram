package com.animal.persistence;

import java.util.List;

import com.animal.domain.CareVO;
import com.animal.domain.SearchCriteria;

public interface AdminCareDAO {

	public List<CareVO> listCare(SearchCriteria cri);
	public int careCount(SearchCriteria cri);
	
	public CareVO selectCare(int cno);
	public int updateCare(CareVO vo);
	public int deleteCare(List<Integer> list);	
	
}
