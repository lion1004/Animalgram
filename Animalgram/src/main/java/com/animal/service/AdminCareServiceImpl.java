package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.animal.domain.CareVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.AdminCareDAO;

@Repository
public class AdminCareServiceImpl implements AdminCareService {
	
	@Inject
	AdminCareDAO dao;
	
	public List<CareVO> listCare(SearchCriteria cri) {
		return dao.listCare(cri);
	}

	public int careCount(SearchCriteria cri) {
		return dao.careCount(cri);
	}

	public int deleteCare(List<Integer> list) {
		return dao.deleteCare(list);
	}

	public CareVO selectCare(int cno) {
		return dao.selectCare(cno);
	}

	public int updateCare(CareVO vo) {
		return dao.updateCare(vo);
	}

}
