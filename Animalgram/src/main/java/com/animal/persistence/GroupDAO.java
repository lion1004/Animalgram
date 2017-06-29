package com.animal.persistence;

import java.util.List;

import com.animal.domain.GroupVO;

public interface GroupDAO {
	public void insert(GroupVO vo);
	public int selectAll();
	public List<GroupVO> selectTen();
	public GroupVO selectId(int gno);
	public void update(GroupVO vo);
	public void delete(int gno);
}
