package com.animal.persistence;

import java.util.List;

import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

public interface AdminCustomDAO {

	public List<CustomVO> listCustom(SearchCriteria cri);
	public int customCount(SearchCriteria cri);
	
	public int deleteCustom(List<Integer> list);
}
