package com.animal.service;

import java.util.List;

import com.animal.domain.Criteria;
import com.animal.domain.CustomAttachVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

public interface CustomService {
	//브라우저 사용자(고객)입장에서 메소드를 정의.
  
   public void regist(CustomVO vo,CustomAttachVO avo)throws Exception;
   public void modify(CustomVO vo)throws Exception;
   public void remove(int cuno)throws Exception;
   
   
   public CustomVO read(int cuno)throws Exception;
   public List<CustomVO> listAll()throws Exception;
   public List<CustomVO> listCriteria(Criteria cri)throws Exception;
   
   public int listCountCriteria()throws Exception;
   
   public List<CustomVO> listSearchCriteria(SearchCriteria cri) throws Exception;
   public int listSearchCount(SearchCriteria cri) throws Exception;
   
   //파일업로드
   public List<String> getAttach(int cuno) throws Exception;
   public int deleteAttach(int cuno) throws Exception;

}
