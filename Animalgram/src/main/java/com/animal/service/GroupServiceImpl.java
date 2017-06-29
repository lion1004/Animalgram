package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.GroupVO;
import com.animal.persistence.GroupDAO;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Inject
	GroupDAO dao;
	
	@Override
	public void insert(GroupVO vo) {
		dao.insert(vo);
	}

	@Override
	public int selectAll() {
		return 0;
	}

	@Override
	public List<GroupVO> selectTen() {
		return dao.selectTen();
	}

	@Override
	public GroupVO selectId(int gno) {
		return dao.selectId(gno);
	}

	@Override
	public void update(GroupVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int gno) {
		dao.delete(gno);
	}

}
