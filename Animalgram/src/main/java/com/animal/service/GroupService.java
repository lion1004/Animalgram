package com.animal.service;

import java.util.List;

import com.animal.domain.AnimalVO;
import com.animal.domain.GroupPersonVO;
import com.animal.domain.GroupVO;

public interface GroupService {
	public void insert(GroupVO vo);
	public int selectAll();
	public List<GroupVO> selectTen();
	public GroupVO selectId(int gno);
	public void update(GroupVO vo);
	public void delete(int gno);
	
	public void insertPerGroup(GroupPersonVO vo);
	public void deletePerGroup(int gpno);
	public int joinPerGroup(int gno);
	public int joinPerGroupsel(GroupPersonVO vo);
	public List<GroupPersonVO> selectPerGroAll();
	public List<GroupPersonVO> selectPerGroRoom(int gno);
	public List<GroupPersonVO> selectPerGroPerson(int mno);
	public GroupPersonVO selectPerGroOne(int gpno);
	public List<AnimalVO> selectperRoomper(List<GroupPersonVO> list);
}
