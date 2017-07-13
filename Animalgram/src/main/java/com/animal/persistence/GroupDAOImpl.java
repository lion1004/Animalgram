package com.animal.persistence;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.AnimalVO;
import com.animal.domain.GroupPersonVO;
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
	
	@Override
	public int joinPerGroup(int gno) {
		return session.selectOne("groupperson.selectRoomCnt", gno);
	}
	@Override
	public int joinPerGroupsel(GroupPersonVO vo) {
		return session.selectOne("groupperson.selectjoin", vo);
	}
	@Override
	public void insertPerGroup(GroupPersonVO vo) {
		session.insert("groupperson.insertPerson", vo);
	}
	@Override
	public void deletePerGroup(int gpno) {
		session.delete("groupperson.deletePerson",gpno);
	}
	@Override
	public List<GroupPersonVO> selectPerGroAll() {
		return session.selectList("groupperson.selectAll");
	}@Override
	public GroupPersonVO selectPerGroOne(int gpno) {
		return session.selectOne("groupperson.selectOne", gpno);
	}@Override
	public List<GroupPersonVO> selectPerGroPerson(int mno) {
		return session.selectList("groupperson.selectPerson",mno);
	}@Override
	public List<GroupPersonVO> selectPerGroRoom(int gno) {
		return session.selectList("groupperson.selectRoom", gno);
	}
	@Override
	public List<AnimalVO> selectperRoomper(List<GroupPersonVO> list) {
		List<AnimalVO> anilist = new ArrayList<>();
		Iterator itor = list.iterator();
		while(itor.hasNext()){
			GroupPersonVO vo = (GroupPersonVO)itor.next();
			anilist.add((AnimalVO)session.selectOne("member.petselectOne", vo));
		}
		return anilist;
	}
}
