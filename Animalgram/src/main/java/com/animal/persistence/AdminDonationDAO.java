package com.animal.persistence;

import java.util.List;

import com.animal.domain.DonationVO;
import com.animal.domain.SearchCriteria;

public interface AdminDonationDAO {
	
	public List<DonationVO> listDonation(SearchCriteria cri);
	public int donationCount(SearchCriteria cri);
	public int deleteDonation(List<Integer> list);
	
}
