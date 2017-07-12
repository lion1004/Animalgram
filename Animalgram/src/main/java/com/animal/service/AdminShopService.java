package com.animal.service;

import java.util.List;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;
import com.animal.domain.Criteria;

public interface AdminShopService {
	//������ ����� (��)���忡�� �޼ҵ带 ����

	
	public void insert(ShopVO vo)throws Exception;
	public void modify(ShopVO vo)throws Exception;//����)throws Exception;
	public void remove(int shno)throws Exception;

	public ShopVO read(int shno)throws Exception;
	public List<ShopVO> listAll()throws Exception;
	public List<ShopVO> listCriteria(Criteria cri)throws Exception;
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	public List<ShopVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
}