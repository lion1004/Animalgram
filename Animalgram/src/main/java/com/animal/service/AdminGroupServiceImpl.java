package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.GroupPersonVO;
import com.animal.domain.GroupVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.AdminGroupDAO;

@Service
public class AdminGroupServiceImpl implements AdminGroupService{
	
	@Inject
	AdminGroupDAO dao;
	
	public List<GroupVO> listGroup(SearchCriteria cri) {
		return dao.listGroup(cri);
	}

	public int groupCount(SearchCriteria cri) {
		return dao.groupCount(cri);
	}

	public List<GroupPersonVO> listPerson(int gno) {
		return dao.listPerson(gno);
	}

	public int deleteGroup(List<Integer> list) {
		return dao.deleteGroup(list);
	}

	public GroupVO selectGroup(int gno) {
		return dao.selectGroup(gno);
	}

	public int updateGroup(GroupVO vo) {
		return dao.updateGroup(vo);
	}
	
}
