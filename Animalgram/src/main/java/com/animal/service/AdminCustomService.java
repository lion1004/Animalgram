package com.animal.service;

import java.util.List;

import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

public interface AdminCustomService {
	public List<CustomVO> listCustom(SearchCriteria cri);
	public int customCount(SearchCriteria cri);
	
	public int deleteCustom(List<Integer> list);
}
