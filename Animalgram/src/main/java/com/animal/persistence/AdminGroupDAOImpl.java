package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.GroupPersonVO;
import com.animal.domain.GroupVO;
import com.animal.domain.SearchCriteria;

@Repository
public class AdminGroupDAOImpl implements AdminGroupDAO{
	
	@Inject
	SqlSession session;

	public List<GroupVO> listGroup(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("adminGroup.listGroup", cri, row);
	}

	public int groupCount(SearchCriteria cri) {
		return session.selectOne("adminGroup.groupCount",cri);
	}

	public List<GroupPersonVO> listPerson(int gno) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteGroup(List<Integer> list) {
		return session.delete("adminGroup.deleteGroup",list);
	}
}
