package com.animal.persistence;

import java.util.List;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;
import com.animal.domain.Criteria;

public interface AdminShopDAO {
	
	
		public void insert(ShopVO vo)throws Exception;//추가
		public void update(ShopVO vo)throws Exception;//수정
		public void delete(int shno)throws Exception;//삭제

		public ShopVO select(int shno)throws Exception;//병원하나 정보 불러오기
		public List<ShopVO> selectAll()throws Exception;//병원 전체 불러오기
		
		//-----------------------------------------
		
		public List<ShopVO> listCriteria(Criteria cri)throws Exception;
		public int countPaging(Criteria cri)throws Exception;
		public int listSearchCount(SearchCriteria cri)throws Exception;//검색해서 가져오는거
		
		public List<ShopVO> listSearch(SearchCriteria cri) throws Exception;//검색
		
		
	}//AdminShopDAO
