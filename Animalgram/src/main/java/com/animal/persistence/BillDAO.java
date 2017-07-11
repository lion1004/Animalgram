package com.animal.persistence;

import java.util.List;

import com.animal.domain.BillVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

public interface BillDAO {

	public void create(BillVO bvo)throws Exception;
	public void update(BillVO bvo)throws Exception;
	public void delete(int bno)throws Exception;
	public List<BillVO> list(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;

	 public void countupdate(BillVO bvo)throws Exception;
}
