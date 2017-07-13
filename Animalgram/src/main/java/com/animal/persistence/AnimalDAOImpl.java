	package com.animal.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

@Repository
public class AnimalDAOImpl implements AnimalDAO {

	@Inject
	private SqlSession sql;
	
	@Override
	public void animalInsert(AnimalVO vo) throws Exception {	// 나의 펫 등록
		sql.insert("member.petinsert",vo);
	}

	@Override
	public List<AnimalVO> selectAni(String nickname) throws Exception {	// 펫 등록정보 불러오기
		return sql.selectList("member.petselect",nickname);
	}

	@Override
	public void proInsert(ProfessionalVO vo) throws Exception {			// 전문가 등록하기
		sql.insert("member.proinsert",vo);
		
	}

	@Override
	public void promember(Map<String, Object> map) throws Exception {	// 전문가 등록하기_job 업데이트
		sql.update("member.proinsert_up",map);
	} 
	
	@Override
	public void selInsert(SellerVO vo) throws Exception {				// 판매자 등록하기
		sql.insert("member.sellinsert",vo);
	}

	@Override
	public List<AgroupVO> selectAgroup(Criteria cri) throws Exception {	// 소모임 현황 조회
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sql.selectList("mypage.agroup",cri,bounds);
	}

	@Override
	public int agroupCount(Criteria cri) throws Exception {				// 소모임 페이징
		return sql.selectOne("mypage.agroup_count",cri);
	}

	@Override
	public List<BillUserVO> customUser(Criteria cri) throws Exception {	// 판매 현황
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.custom_user",cri,bounds);
	}

	@Override
	public int customUcount(Criteria cri) throws Exception {			// 판매 현황 페이징
		return sql.selectOne("mypage.custom_user_count",cri);
	}

	
	@Override
	public List<CareVO> selectCare(Criteria cri) throws Exception {		// 훈련 현황 조회
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.care",cri,bounds);
	}

	@Override
	public int careCount(Criteria cri) throws Exception {				// 훈련  현황 페이징
		return sql.selectOne("mypage.care_count",cri);
	}

	@Override
	public boolean caredelete(int cano) throws Exception {				// 훈련 삭제
		if(sql.delete("mypage.care_user_delete",cano) == 1){
			return true;
		}else
			return false;
	}
	
	@Override
	public List<CareProVO> carePro(Criteria cri) throws Exception {				// 훈련 현황 요청 조회 전문가용
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.care_pro",cri,bounds);
	}

	@Override
	public int careProCount(Criteria cri) throws Exception {					// 훈현 현황 요청 조회 전문가용 페이징
		return sql.selectOne("mypage.care_pro_count",cri);
	}

	@Override
	public List<CareProVO> careProComit(Criteria cri) throws Exception {				// 훈련 현황 요청 승인 조회 전문가용
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.care_pro_comit",cri,bounds);
	}
	
	@Override
	public int careProCountComit(Criteria cri) throws Exception {					// 훈현 현황 요청 조회 승인 전문가용 페이징
		return sql.selectOne("mypage.care_pro_count_cmit",cri);
	}
	
	@Override
	public boolean careProUPdate(int cano) throws Exception {				// 훈현 현황 요청 승인 전문가용
		if(sql.update("mypage.update_care",cano) == 1){
			return true;
		}else
			return false;
	}
	
	@Override
	public List<CareProVO> careProSelect(Criteria cri) throws Exception {		// 훈련 현황 조회(전문가용)
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.care_pro_select",cri,bounds);
	}

	@Override
	public int careProSelCount(Criteria cri) throws Exception {				// 훈련 현황 페이징
		return sql.selectOne("mypage.care_pro_select_count",cri);
	}

	@Override
	public int careProdelete(int cno) throws Exception {		// 등록된 훈련 삭제
		return sql.delete("mypage.delete_care_pro",cno);
	}

	@Override
	public List<CustomVO> customSel(Criteria cri) throws Exception {	// 판매 물품 현황 조회
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.custom_select",cri,bounds);
	}

	@Override
	public boolean customUdel(int bno) throws Exception {		// 판매 현황 삭제 (User)
		if(sql.delete("mypage.cusUser_del",bno) == 1){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public int customCount(Criteria cri) throws Exception {				// 판매 물품 현황 조회 페이징
		return sql.selectOne("mypage.custom_page",cri);
	}
	
	@Override
	public List<DonationVO> donation_now(Criteria cri) throws Exception {	// 나눔 등록자 현황 조회
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.donation_now",cri,bounds);
	}

	@Override
	public int donation_now_page(Criteria cri) throws Exception {		// 나눔 등록자 현황 페이징
		return sql.selectOne("mypage.donation_now_page",cri);
	}


	@Override
	public boolean donation_del(int dno) throws Exception {		// 나눔 게시글 삭제
		if(sql.delete("mypage.donation_nowdel",dno) == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<DonationCheckVO> donationCheck(Criteria cri) throws Exception {	// 나눔 당첨자 조회
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.donation_check",cri,bounds);
	}

	@Override
	public int donationCheckCount(Criteria cri) throws Exception {		// 나눔 당첨자 조회 페이징
		return sql.selectOne("mypage.donation_check_count",cri);
	}

	@Override
	public boolean donationUp(int dano) throws Exception{			// 나눔 승인
		
		if(sql.update("mypage.donation_up",dano) == 1){
			return true;
		}else
		return false;
	}


	@Override
	public List<DonationCheckVO> donationCheckOk(Criteria cri) throws Exception {	// 나눔 당첨 완료 조회
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.donation_ok_check",cri,bounds);
	}

	@Override
	public int donationCheckOkCount(Criteria cri) throws Exception {	// 나눔 당첨 완료 페이징
		return sql.selectOne("mypage.donation_check_ok_count",cri);
	}
	
	@Override
	public List<BillVO> billSel(Criteria cri) throws Exception {		// 판매 요청
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.bill_select",cri,bounds);
	}

	@Override
	public int billCount(Criteria cri) throws Exception {				// 판매 요청 페이징
		return sql.selectOne("mypage.bill_count",cri);
	}

	@Override
	public boolean bill_update(int bno) throws Exception {
		if(sql.update("mypage.bill_update",bno) == 1){
			return true;
		}else
		return false;
	}
	
	@Override
	public List<BillVO> billComit(Criteria cri) throws Exception {		// 판매 요청 승인
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.bill_comit_select",cri,bounds);
	}

	@Override
	public int billComitCount(Criteria cri) throws Exception {			// 판매 요청 승인 페이징
		return sql.selectOne("mypage.bill_comit_count",cri);
	}
}
