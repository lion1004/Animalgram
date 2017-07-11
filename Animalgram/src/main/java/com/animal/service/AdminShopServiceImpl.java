package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;
import com.animal.persistence.AdminShopDAO;
import com.animal.domain.Criteria;

@Service
public class AdminShopServiceImpl implements AdminShopService{

	@Inject
	AdminShopDAO dao;
	
	@Override
	public void insert(ShopVO vo) throws Exception {//DAO쪽 '추가'연결
		dao.insert(vo);
	}

	@Override
	public void modify(int shno,String shparking,String shsite,String shtime,
			String shtel,String shaddr,String shname,String shtype) throws Exception {
		
		
		dao.update(shno,shparking,shsite,shtime,shtel,shaddr,shname,shtype);
		
	}
	

	@Override
	public void remove(int shno) throws Exception {//DAO쪽 '삭제'연결
		dao.delete(shno);
	}

	@Override
	public ShopVO read(int shno) throws Exception {//DAO쪽 '한개행출'연결
		
		return dao.select(shno);
	}

	@Override
	public List<ShopVO> listAll() throws Exception {//DAO쪽 '전체리스트'연결
		
		return dao.selectAll();
	}

	@Override
	public List<ShopVO> listCriteria(Criteria cri) throws Exception {
		
		return dao.listCriteria(cri);//전체 리스트 불러오기 ! criteria적용
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception { //숫자 카운터 숫자받아온다.
		
		return dao.countPaging(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

	@Override
	public List<ShopVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}



	




	
	
}//class