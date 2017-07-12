package com.animal.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.GroupVO;

@Repository
public class GroupDAOImpl implements GroupDAO {

	@Inject
	private SqlSession session;
	

	@Override
	public void insert(GroupVO vo) {
		session.insert("group.makeGroup",vo);
	}

	@Override
	public int selectAll() {
		return session.selectOne("");
	}

	@Override
	public List<GroupVO> selectTen() {
		return session.selectList("group.selectGroupAll");
	}

	@Override
	public GroupVO selectId(int gno) {
		return session.selectOne("group.selectGroup",gno);
	}

	@Override
	public void update(GroupVO vo) {
		session.update("group.updateGroup",vo);
	}

	@Override
	public void delete(int gno) {
		session.delete("group.deleteGroupOne",gno);
	}
	
}
