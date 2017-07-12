package com.animal.persistence;

import java.util.List;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;
import com.animal.domain.Criteria;

public interface AdminShopDAO {
	
	
		public void insert(ShopVO vo)throws Exception;//�߰�
		public void update(ShopVO vo)throws Exception;//����
		public void delete(int shno)throws Exception;//����

		public ShopVO select(int shno)throws Exception;//�����ϳ� ���� �ҷ�����
		public List<ShopVO> selectAll()throws Exception;//���� ��ü �ҷ�����
		
		//-----------------------------------------
		
		public List<ShopVO> listCriteria(Criteria cri)throws Exception;
		public int countPaging(Criteria cri)throws Exception;
		public int listSearchCount(SearchCriteria cri)throws Exception;//�˻��ؼ� �������°�
		
		public List<ShopVO> listSearch(SearchCriteria cri) throws Exception;//�˻�
		
		
	}//AdminShopDAO
