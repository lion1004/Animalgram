package com.animal.service;

import java.util.List;

import com.animal.domain.Criteria;
import com.animal.domain.DonationAskVO;
import com.animal.domain.DonationAttachVO;
import com.animal.domain.DonationVO;
import com.animal.domain.SearchCriteria;

public interface DonationService {
	//������ �����(��)���忡�� �޼ҵ带 ����.
  
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

   
   //���Ͼ��ε�
 /*  public List<String> getAttach(int dno) throws Exception;
   public int deleteAttach(int dno) throws Exception;*/

}

