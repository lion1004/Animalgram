package com.animal.service;

import java.util.List;

import com.animal.domain.DonationAskVO;
import com.animal.domain.SearchCriteria;

public interface DonationAskService {

    public void registAsk(DonationAskVO davo)throws Exception;	
    public void modifyAsk(DonationAskVO davo)throws Exception;	
    public void removeAsk(int dno)throws Exception;	

    public List<DonationAskVO> listAsk(SearchCriteria cri)throws Exception;	
    public int listSearchCount(SearchCriteria cri) throws Exception;
	
    
   
}
