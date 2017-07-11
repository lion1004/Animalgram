package com.animal.persistence;

import java.util.List;

import com.animal.domain.Criteria;
import com.animal.domain.CustomAttachVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

public interface CustomDAO {
   public void create(CustomVO vo)throws Exception;//�߰�
   public void update(CustomVO vo)throws Exception;//����
  
   public void delete(int cuno)throws Exception;//����
   
   public CustomVO read(int cuno)throws Exception;//��ȸ(����-������)
   public List<CustomVO> listAll()throws Exception;//��ȸ(������-����Ʈ)
   public List<CustomVO> listPage(int page)throws Exception;//��ȸ(������-����Ʈ)
   public List<CustomVO> listCriteria(Criteria cri)throws Exception;//��ȸ(������-����Ʈ)
   
   public int cucount() throws Exception;
   
   //��ü���ڵ� ��
   public int countPaging()throws Exception;//��ȸ(������-����Ʈ)
   
   //�˻��� ��ȸ
   public List<CustomVO> listSearch(SearchCriteria cri)throws Exception;
   public int listSearchCount(SearchCriteria cri) throws Exception;
   
   //���� ���ε�
   public int addAttach(CustomAttachVO avo)throws Exception;
   public List<String> getAttach(int cuno)throws Exception;
   public int deleteAttach(int cuno)throws Exception;
   public int replaceAttach(String fullName, int cuno)throws Exception;
   
}





