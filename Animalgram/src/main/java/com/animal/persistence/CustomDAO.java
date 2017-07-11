package com.animal.persistence;

import java.util.List;

import com.animal.domain.Criteria;
import com.animal.domain.CustomAttachVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

public interface CustomDAO {
   public void create(CustomVO vo)throws Exception;//추가
   public void update(CustomVO vo)throws Exception;//수정
  
   public void delete(int cuno)throws Exception;//삭제
   
   public CustomVO read(int cuno)throws Exception;//조회(한행-수정폼)
   public List<CustomVO> listAll()throws Exception;//조회(여러행-리스트)
   public List<CustomVO> listPage(int page)throws Exception;//조회(여러행-리스트)
   public List<CustomVO> listCriteria(Criteria cri)throws Exception;//조회(여러행-리스트)
   
   public int cucount() throws Exception;
   
   //전체레코드 수
   public int countPaging()throws Exception;//조회(여러행-리스트)
   
   //검색어 조회
   public List<CustomVO> listSearch(SearchCriteria cri)throws Exception;
   public int listSearchCount(SearchCriteria cri) throws Exception;
   
   //파일 업로드
   public int addAttach(CustomAttachVO avo)throws Exception;
   public List<String> getAttach(int cuno)throws Exception;
   public int deleteAttach(int cuno)throws Exception;
   public int replaceAttach(String fullName, int cuno)throws Exception;
   
}





