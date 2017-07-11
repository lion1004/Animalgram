package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.BillVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

@Repository
public class BillDAOImpl implements BillDAO {

	@Inject
	private SqlSession sqlSession; 
	
	@Override
	public void create(BillVO bvo) throws Exception {
		System.out.println("billdaoimpl"+bvo);
		sqlSession.insert("bill.create",bvo);
	}

	@Override
	public void update(BillVO bvo) throws Exception {
		sqlSession.update("bill.update", bvo);
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("bill.delete", bno);
	}

	@Override
	public List<BillVO> list(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		 return sqlSession.selectList("bill.list",cri,bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne("bill.listSearchCount",cri);
	}

	@Override
	public void countupdate(BillVO bvo) throws Exception {
		sqlSession.update("bill.sellcount", bvo);
	}



}
