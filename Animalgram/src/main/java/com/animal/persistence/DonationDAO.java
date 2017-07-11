package com.animal.persistence;

import java.util.List;

import com.animal.domain.Criteria;
import com.animal.domain.DonationAttachVO;
import com.animal.domain.DonationVO;
import com.animal.domain.SearchCriteria;

public interface DonationDAO {
   public void create(DonationVO dvo)throws Exception;//추가
   public void update(DonationVO dvo)throws Exception;//수정
   public int sellcount(DonationVO dvo)throws Exception;
   public void delete(int dno)throws Exception;//삭제
   
   public DonationVO read(int dno)throws Exception;//조회(한행-수정폼)
   public List<DonationVO> listAll()throws Exception;//조회(여러행-리스트)
   public List<DonationVO> listPage(int page)throws Exception;//조회(여러행-리스트)
   public List<DonationVO> listCriteria(Criteria cri)throws Exception;//조회(여러행-리스트)
   
   public int cucount() throws Exception;
   
   //전체레코드 수
   public int countPaging()throws Exception;//조회(여러행-리스트)
   
   //검색어 조회
   public List<DonationVO> listSearch(SearchCriteria cri)throws Exception;
   public int listSearchCount(SearchCriteria cri) throws Exception;
   
   //파일 업로드
 /*  public int addAttach(DonationAttachVO dattachvo)throws Exception;
   public List<String> getAttach(int dno)throws Exception;
   public int deleteAttach(int dno)throws Exception;
   public int replaceAttach(String fullName, int dno)throws Exception;*/
   
}





