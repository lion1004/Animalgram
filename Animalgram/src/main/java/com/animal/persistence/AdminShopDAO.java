package com.animal.persistence;

import java.util.List;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;

public interface AdminShopDAO {
	
	public List<ShopVO> listShop(SearchCriteria cri);
	public int shopCount(SearchCriteria cri);
	
	public int deleteShop(List<Integer> list);
}
