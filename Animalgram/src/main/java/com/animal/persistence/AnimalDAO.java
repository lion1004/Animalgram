package com.animal.persistence;

import java.util.List;
import java.util.Map;

import com.animal.domain.AgroupVO;
import com.animal.domain.AnimalVO;
import com.animal.domain.BillVO;
import com.animal.domain.CareProVO;
import com.animal.domain.CareVO;
import com.animal.domain.Criteria;
import com.animal.domain.CustomVO;
import com.animal.domain.ProfessionalVO;
import com.animal.domain.SellerVO;

public interface AnimalDAO {

	public void animalInsert(AnimalVO vo)throws Exception;	// 나의 펫 등록
	public List<AnimalVO> selectAni(String nickname)throws Exception;	// 마이 펫 정보 보기
	
	public void proInsert(ProfessionalVO vo)throws Exception;	// 전문가 등록
	public void promember(Map<String,Object> map)throws Exception;	// 전문가 등록_멤버 JOB 업데이트
	
	public void selInsert(SellerVO vo)throws Exception;	// 판매자 등록
	
	public List<AgroupVO> selectAgroup(Criteria cri)throws Exception;	// 소모임 현황 조회
	public int agroupCount(Criteria cri)throws Exception;	// 소모임 갯수(페이징)
	
	public List<CareVO> selectCare(Criteria cri)throws Exception;	// 훈련 현황 조회
	public int careCount(Criteria cri)throws Exception;				// 훈련 현황 갯수(페이징)
	public boolean caredelete(int cano)throws Exception;			// 훈련 삭제
	
	// 전문가
	public List<CareProVO> carePro(Criteria cri)throws Exception;	// 훈련 요청 현황 전문가
	public int careProCount(Criteria cri)throws Exception;			// 훈련 요청 현황 전문가 페이징 
	
	public List<CareProVO> careProComit(Criteria cri) throws Exception;		// 훈련 승인 전문가
	public int careProCountComit(Criteria cri) throws Exception;			// 훈련 승인 전문가 페이징
	
	public boolean careProUPdate(int cano)throws Exception;			// 훈련 요청 승인 전문가
	
	public List<CareProVO> careProSelect(Criteria cri)throws Exception;	// 훈련 요청 현황 전문가
	public int careProSelCount(Criteria cri)throws Exception;			// 훈련 요청 현황 전문가 페이징 
	
	public int careProdelete(int cno)throws Exception;					// 등록된 훈련 삭제
	
	// 판매자
	public List<CustomVO> customSel(Criteria cri)throws Exception;		// 판매자 물품 현황
	public int customCount(Criteria cri)throws Exception;				// 판매자 물품 현황 페이징

	public List<BillVO> billSel(Criteria cri)throws Exception;			// 판매 요청 현황
	public int billCount(Criteria cri)throws Exception;					// 판매 요청 현황 페이징
	
	public boolean bill_update(int bno)throws Exception;		// 판매 승인
	
	public List<BillVO> billComit(Criteria cri)throws Exception;		// 판매자 승인 현황
	public int billComitCount(Criteria cri)throws Exception;			// 판매자 승인 페이징
} // class
