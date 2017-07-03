package com.animal.service;

import java.util.List;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;

public interface AdminShopService {
	public List<ShopVO> listShop(SearchCriteria cri);
	public int shopCount(SearchCriteria cri);
	
	public int deleteShop(List<Integer> list);
}
