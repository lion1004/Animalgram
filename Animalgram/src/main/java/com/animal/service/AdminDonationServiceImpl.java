package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.DonationVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.AdminDonationDAO;

@Service
public class AdminDonationServiceImpl implements AdminDonationService {
	
	@Inject
	AdminDonationDAO dao;

	public List<DonationVO> listDonation(SearchCriteria cri) {
		return dao.listDonation(cri);
	}

	
	public int donationCount(SearchCriteria cri) {
		return dao.donationCount(cri);
	}

	@Override
	public int deleteDonation(List<Integer> list) {
		return dao.deleteDonation(list);
	}

}
