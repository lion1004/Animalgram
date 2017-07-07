package com.animal.persistence;

import java.util.List;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;

public interface AdminShopDAO {
	
	public List<ShopVO> listShop(SearchCriteria cri);
	public int shopCount(SearchCriteria cri);
	
	public ShopVO selectShop(int shno);
	public int updateShop(ShopVO vo);
	public int deleteShop(List<Integer> list);
}
