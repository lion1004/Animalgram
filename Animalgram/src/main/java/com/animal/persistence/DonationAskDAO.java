package com.animal.persistence;

import java.util.List;

import com.animal.domain.BillVO;
import com.animal.domain.DonationAskVO;
import com.animal.domain.SearchCriteria;

public interface DonationAskDAO {

	public void create(DonationAskVO davo)throws Exception;
	public void update(DonationAskVO davo)throws Exception;
	public void delete(int dno)throws Exception;
	public List<DonationAskVO> list(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;


}
