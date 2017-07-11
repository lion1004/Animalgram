package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.BillVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.BillDAO;

@Service
public class BillServiceImpl implements BillService {

	@Inject
	private BillDAO dao;
	
	@Override
	public void registBill(BillVO bvo) throws Exception {
		dao.create(bvo);
	}

	@Override
	public void modifyBill(BillVO bvo) throws Exception {
		dao.update(bvo);
	}

	@Override
	public void removeBill(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<BillVO> listBill(SearchCriteria cri) throws Exception {
		return dao.list(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	@Override
	public void countupdate(BillVO bvo) throws Exception {
		 dao.countupdate(bvo);
	}
	

	
}
