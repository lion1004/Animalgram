package com.animal.service;

import java.util.List;

import com.animal.domain.Criteria;
import com.animal.domain.DonationAskVO;
import com.animal.domain.DonationAttachVO;
import com.animal.domain.DonationVO;
import com.animal.domain.SearchCriteria;

public interface DonationService {
	//브라우저 사용자(고객)입장에서 메소드를 정의.
  
   public void regist(DonationVO dvo)throws Exception;
   public void modify(DonationVO dvo)throws Exception;
   public void remove(int dno)throws Exception;
   public int sellcount(DonationVO dvo)throws Exception;
   
   public DonationVO read(int dno)throws Exception;
   public List<DonationVO> listAll()throws Exception;
   public List<DonationVO> listCriteria(Criteria cri)throws Exception;
   
   public int listCountCriteria()throws Exception;
   
   public List<DonationVO> listSearchCriteria(SearchCriteria cri) throws Exception;
   public int listSearchCount(SearchCriteria cri) throws Exception;

   
   //파일업로드
 /*  public List<String> getAttach(int dno) throws Exception;
   public int deleteAttach(int dno) throws Exception;*/

}

