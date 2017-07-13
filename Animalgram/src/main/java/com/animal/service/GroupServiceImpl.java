package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.AnimalVO;
import com.animal.domain.GroupPersonVO;
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
	public int joinPerGroup(int gno) {
		return dao.joinPerGroup(gno);
	}
	@Override
	public int joinPerGroupsel(GroupPersonVO vo) {
		return dao.joinPerGroupsel(vo);
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

	@Override
	public void insertPerGroup(GroupPersonVO vo) {
		dao.insertPerGroup(vo);
	}

	@Override
	public void deletePerGroup(int gpno) {
		dao.deletePerGroup(gpno);
	}

	@Override
	public List<GroupPersonVO> selectPerGroAll() {
		return dao.selectPerGroAll();
	}

	@Override
	public List<GroupPersonVO> selectPerGroRoom(int gno) {
		return dao.selectPerGroRoom(gno);
	}

	@Override
	public List<GroupPersonVO> selectPerGroPerson(int mno) {
		return dao.selectPerGroPerson(mno);
	}

	@Override
	public GroupPersonVO selectPerGroOne(int gpno) {
		return dao.selectPerGroOne(gpno);
	}

	@Override
	public List<AnimalVO> selectperRoomper(List<GroupPersonVO> list) {
		return dao.selectperRoomper(list);
	}
}
