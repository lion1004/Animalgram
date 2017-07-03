package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;
import com.animal.persistence.AdminShopDAO;

@Service
public class AdminShopServiceImpl implements AdminShopService{

	@Inject
	AdminShopDAO dao;
	
	public List<ShopVO> listShop(SearchCriteria cri) {
		return dao.listShop(cri);
	}

	public int shopCount(SearchCriteria cri) {
		return dao.shopCount(cri);
	}

	public int deleteShop(List<Integer> list) {
		return dao.deleteShop(list);
	}

}
