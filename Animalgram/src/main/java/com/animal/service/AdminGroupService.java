package com.animal.service;

import java.util.List;

import com.animal.domain.GroupPersonVO;
import com.animal.domain.GroupVO;
import com.animal.domain.SearchCriteria;

public interface AdminGroupService {
	
	public List<GroupVO> listGroup(SearchCriteria cri);
	public int groupCount(SearchCriteria cri);
	public List<GroupPersonVO> listPerson(int gno);
	
	public int deleteGroup(List<Integer> list);
}
