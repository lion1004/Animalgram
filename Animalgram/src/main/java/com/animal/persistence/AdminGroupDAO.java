package com.animal.persistence;

import java.util.List;

import com.animal.domain.GroupPersonVO;
import com.animal.domain.GroupVO;
import com.animal.domain.SearchCriteria;

public interface AdminGroupDAO {
	
	public List<GroupVO> listGroup(SearchCriteria cri);
	public int groupCount(SearchCriteria cri);
	public List<GroupPersonVO> listPerson(int gno);
	
	public GroupVO selectGroup(int gno);
	public int updateGroup(GroupVO vo);
	
	public int deleteGroup(List<Integer> list);
}
