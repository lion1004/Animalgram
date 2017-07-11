package com.animal.service;

import java.util.List;

import com.animal.domain.Criteria;
import com.animal.domain.CustomAttachVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

public interface CustomService {
	//������ �����(��)���忡�� �޼ҵ带 ����.
  
   public void regist(CustomVO vo,CustomAttachVO avo)throws Exception;
   public void modify(CustomVO vo)throws Exception;
   public void remove(int cuno)throws Exception;
   
   
   public CustomVO read(int cuno)throws Exception;
   public List<CustomVO> listAll()throws Exception;
   public List<CustomVO> listCriteria(Criteria cri)throws Exception;
   
   public int listCountCriteria()throws Exception;
   
   public List<CustomVO> listSearchCriteria(SearchCriteria cri) throws Exception;
   public int listSearchCount(SearchCriteria cri) throws Exception;
   
   //���Ͼ��ε�
   public List<String> getAttach(int cuno) throws Exception;
   public int deleteAttach(int cuno) throws Exception;

}
