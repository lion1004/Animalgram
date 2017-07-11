package com.animal.persistence;

import java.util.List;

import com.animal.domain.Criteria;
import com.animal.domain.DonationAttachVO;
import com.animal.domain.DonationVO;
import com.animal.domain.SearchCriteria;

public interface DonationDAO {
   public void create(DonationVO dvo)throws Exception;//�߰�
   public void update(DonationVO dvo)throws Exception;//����
   public int sellcount(DonationVO dvo)throws Exception;
   public void delete(int dno)throws Exception;//����
   
   public DonationVO read(int dno)throws Exception;//��ȸ(����-������)
   public List<DonationVO> listAll()throws Exception;//��ȸ(������-����Ʈ)
   public List<DonationVO> listPage(int page)throws Exception;//��ȸ(������-����Ʈ)
   public List<DonationVO> listCriteria(Criteria cri)throws Exception;//��ȸ(������-����Ʈ)
   
   public int cucount() throws Exception;
   
   //��ü���ڵ� ��
   public int countPaging()throws Exception;//��ȸ(������-����Ʈ)
   
   //�˻��� ��ȸ
   public List<DonationVO> listSearch(SearchCriteria cri)throws Exception;
   public int listSearchCount(SearchCriteria cri) throws Exception;
   
   //���� ���ε�
 /*  public int addAttach(DonationAttachVO dattachvo)throws Exception;
   public List<String> getAttach(int dno)throws Exception;
   public int deleteAttach(int dno)throws Exception;
   public int replaceAttach(String fullName, int dno)throws Exception;*/
   
}





