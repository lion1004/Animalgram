package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.BillVO;
import com.animal.domain.DonationAskVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.DonationAskDAO;

@Service
public class DonationAskServiceImpl implements DonationAskService {

	@Inject
	private DonationAskDAO dadao;
	
	@Override
	public void registAsk(DonationAskVO davo) throws Exception {
		dadao.create(davo);
	}

	@Override
	public void modifyAsk(DonationAskVO davo) throws Exception {
		dadao.update(davo);
	}

	@Override
	public void removeAsk(int dno) throws Exception {
		dadao.delete(dno);
	}

	@Override
	public List<DonationAskVO> listAsk(SearchCriteria cri) throws Exception {
		System.out.println("donation serviceImpl list :"+dadao.list(cri));
		return dadao.list(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dadao.listSearchCount(cri);
	}

	

	
}
