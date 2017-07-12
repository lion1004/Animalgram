package com.animal.service;

import java.util.List;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;
import com.animal.domain.Criteria;

public interface AdminShopService {
	//브라우저 사용자 (고객)입장에서 메소드를 정의

	
	public void insert(ShopVO vo)throws Exception;
	public void modify(ShopVO vo)throws Exception;//수정)throws Exception;
	public void remove(int shno)throws Exception;

	public ShopVO read(int shno)throws Exception;
	public List<ShopVO> listAll()throws Exception;
	public List<ShopVO> listCriteria(Criteria cri)throws Exception;
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	public List<ShopVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
}