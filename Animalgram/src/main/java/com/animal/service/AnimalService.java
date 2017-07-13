package com.animal.service;

import java.util.List;
import java.util.Map;

import com.animal.domain.AgroupVO;
import com.animal.domain.AnimalVO;
import com.animal.domain.BillUserVO;
import com.animal.domain.BillVO;
import com.animal.domain.CareProVO;
import com.animal.domain.CareVO;
import com.animal.domain.Criteria;
import com.animal.domain.CustomVO;
import com.animal.domain.DonationCheckVO;
import com.animal.domain.DonationVO;
import com.animal.domain.ProfessionalVO;
import com.animal.domain.SellerVO;

public interface AnimalService {

	public void insertAni(AnimalVO vo)throws Exception;	// 펫 등록
	public List<AnimalVO> selecAni(String nickname)throws Exception;	// 펫 목록

	public void insertPro(ProfessionalVO vo,Map<String,Object> map)throws Exception;	// 전문가 등록
	public void insertSel(SellerVO vo)throws Exception;			// 판매자 등록
	
	public List<AgroupVO> agroupList(Criteria cri)throws Exception;	// 소모임 현황 등록
	public int agroupCount(Criteria cri)throws Exception;		// 소모임 갯수(페이징)
	
	public List<BillUserVO> customUser(Criteria cri)throws Exception;	// 판매 현황 조회
	public int customUCount(Criteria cri)throws Exception;				// 판매 현황 조회 페이징
	public boolean customUdel(int bno)throws Exception;			// 판매 현황 삭제
	
	public List<CareVO> careList(Criteria cri)throws Exception;	// 훈련 현황 조회
	public int careCount(Criteria cri)throws Exception;			// 훈련 현황 조회(페이징)

	public boolean careUserDel(int cano)throws Exception;		// 훈련 삭제
	
	public List<DonationVO> donation_now(Criteria cri)throws Exception;	// 나눔 현황 올린사람
	public int donation_now_count(Criteria cri)throws Exception;	// 나눔 현황 페이징
	public boolean donation_del(int dno)throws Exception;			// 나눔 등록 삭제
	
	public List<DonationCheckVO> donationCheck(Criteria cri)throws Exception;	// 나눔 현황 당첨자
	public int donationCheckCount(Criteria cri)throws Exception;	// 나눔 현황 당첨자 페이징
	
	public boolean donationUp(int dano)throws Exception;			// 나눔 승인

	public List<DonationCheckVO> donationCheckOk(Criteria cri)throws Exception;	// 나눔 현황 완료
	public int donationCheckCountOK(Criteria cri)throws Exception;	// 나눔 현황 완료 페이징
	
	// 전문가용
	public List<CareProVO> procare(Criteria cri)throws Exception;	// 훈련 현황 요청 전문가용
	public int careProcount(Criteria cri)throws Exception;			// 훈련 현황 요청 전문가용 페이징

	public List<CareProVO> procareComit(Criteria cri)throws Exception;	// 훈련 현황 요청 전문가용
	public int careProcountComit(Criteria cri)throws Exception;			// 훈련 현황 요청 전문가용 페이징
	
	public boolean careProUp(int cano)throws Exception;		// 훈련 현황 요청 승인

	public List<CareProVO> procareSelect(Criteria cri)throws Exception;	// 훈련 현황 전문가용
	public int careProSelcount(Criteria cri)throws Exception;			// 훈련 현황 전문가용 페이징
	
	public int careProdelete(int cno)throws Exception;				// 훈련 현황 삭제(전문가용)
	

	// 판매자용
	public List<CustomVO> customSelect(Criteria cri)throws Exception;	// 판매 현황 조회
	public int customPage(Criteria cri)throws Exception;			// 판매 현황 조회 페이징
		
	public List<BillVO> billSelect(Criteria cri)throws Exception;		// 판매 요청 조회
	public int billCount(Criteria cri)throws Exception;					// 판매 요청 페이징
	
	public boolean bill_update(int bno)throws Exception;			// 판매 요청 승인
	
	public List<BillVO> billComit(Criteria cri)throws Exception;		// 판매 승인 조회
	public int billComitCount(Criteria cri)throws Exception;			// 판매 승인 페이징

} // class
