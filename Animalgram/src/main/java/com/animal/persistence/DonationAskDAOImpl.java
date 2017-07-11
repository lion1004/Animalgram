package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.BillVO;
import com.animal.domain.DonationAskVO;
import com.animal.domain.SearchCriteria;

@Repository
public class DonationAskDAOImpl implements DonationAskDAO {

	@Inject
	private SqlSession sqlSession; 
	
	@Override
	public void create(DonationAskVO davo) throws Exception {
		sqlSession.insert("donationask.create",davo);
	}

	@Override
	public void update(DonationAskVO davo) throws Exception {
		sqlSession.update("donationask.update", davo);
	}

	@Override
	public void delete(int dno) throws Exception {
		sqlSession.delete("donationask.delete", dno);
	}

	@Override
	public List<DonationAskVO> list(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		System.out.println("donation daoimpl :"+cri);
		 return sqlSession.selectList("donationask.list",cri,bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne("donationask.listSearchCount",cri);
	}



}
