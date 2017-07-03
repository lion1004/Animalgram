package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.DonationVO;
import com.animal.domain.SearchCriteria;

@Repository
public class AdminDonationDAOImpl implements AdminDonationDAO {

	@Inject
	SqlSession session;
	
	public List<DonationVO> listDonation(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return session.selectList("adminDonation.listDonation",cri,row);
	}

	public int donationCount(SearchCriteria cri) {
		return session.selectOne("adminDonation.donationCount",cri);
	}

	public int deleteDonation(List<Integer> list) {
		return session.delete("adminDonation.deleteDonation",list);
	}

}
