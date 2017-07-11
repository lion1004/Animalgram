package com.animal.service;

import java.util.List;

import com.animal.domain.BillVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

public interface BillService {

    public void registBill(BillVO bvo)throws Exception;	
    public void modifyBill(BillVO bvo)throws Exception;	
    public void removeBill(int bno)throws Exception;	

    public List<BillVO> listBill(SearchCriteria cri)throws Exception;	
    public int listSearchCount(SearchCriteria cri) throws Exception;
    
    public void countupdate(BillVO bvo)throws Exception;
}
