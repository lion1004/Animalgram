package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.AdminCustomDAO;

@Service
public class AdminCustomServiceImpl implements AdminCustomService{

	@Inject
	AdminCustomDAO dao;
	
	public List<CustomVO> listCustom(SearchCriteria cri) {
		return dao.listCustom(cri);
	}

	public int customCount(SearchCriteria cri) {
		return dao.customCount(cri);
	}

	public int deleteCustom(List<Integer> list) {
		return dao.deleteCustom(list);
	}

}
