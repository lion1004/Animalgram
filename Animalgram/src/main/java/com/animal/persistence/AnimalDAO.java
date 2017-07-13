package com.animal.persistence;

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

public interface AnimalDAO {

	public void animalInsert(AnimalVO vo)throws Exception;	// ���� �� ���
	public List<AnimalVO> selectAni(String nickname)throws Exception;	// ���� �� ���� ����
	
	public void proInsert(ProfessionalVO vo)throws Exception;	// ������ ���
	public void promember(Map<String,Object> map)throws Exception;	// ������ ���_��� JOB ������Ʈ
	
	public void selInsert(SellerVO vo)throws Exception;	// �Ǹ��� ���
	
	public List<AgroupVO> selectAgroup(Criteria cri)throws Exception;	// �Ҹ��� ��Ȳ ��ȸ
	public int agroupCount(Criteria cri)throws Exception;	// �Ҹ��� ����(����¡)
	
	public List<CareVO> selectCare(Criteria cri)throws Exception;	// �Ʒ� ��Ȳ ��ȸ
	public int careCount(Criteria cri)throws Exception;				// �Ʒ� ��Ȳ ����(����¡)
	public boolean caredelete(int cano)throws Exception;			// �Ʒ� ����
	
	public List<BillUserVO> customUser(Criteria cri)throws Exception;	// �Ǹ� ��Ȳ ��ȸ
	public boolean customUdel(int bno)throws Exception;				// �Ǹ���Ȳ ����
	public int customUcount(Criteria cri)throws Exception;				// �Ǹ� ��Ȳ ��ȸ ����¡
	
	public List<DonationVO> donation_now(Criteria cri)throws Exception;	// ���� ��Ȳ ��ȸ
	public boolean donation_del(int dno)throws Exception;				// ���� ��� ����
	public int donation_now_page(Criteria cri)throws Exception;			// ���� ��Ȳ ��ȸ ����¡

	public List<DonationCheckVO> donationCheck(Criteria cri)throws Exception;	// ���� ��÷ ��ȸ
	public int donationCheckCount(Criteria cri)throws Exception;			// ���� ��÷ ��ȸ ����¡
	
	public boolean donationUp(int dano)throws Exception;			// ���� ����
	
	public List<DonationCheckVO> donationCheckOk(Criteria cri)throws Exception;	// ���� ��÷ �Ϸ� ��ȸ
	public int donationCheckOkCount(Criteria cri)throws Exception;			// ���� ��÷ �Ϸ� ��ȸ ����¡	
	
	// ������
	public List<CareProVO> carePro(Criteria cri)throws Exception;	// �Ʒ� ��û ��Ȳ ������
	public int careProCount(Criteria cri)throws Exception;			// �Ʒ� ��û ��Ȳ ������ ����¡ 
	
	public List<CareProVO> careProComit(Criteria cri) throws Exception;		// �Ʒ� ���� ������
	public int careProCountComit(Criteria cri) throws Exception;			// �Ʒ� ���� ������ ����¡
	
	
	public boolean careProUPdate(int cano)throws Exception;			// �Ʒ� ��û ���� ������
	
	public List<CareProVO> careProSelect(Criteria cri)throws Exception;	// �Ʒ� ��û ��Ȳ ������
	public int careProSelCount(Criteria cri)throws Exception;			// �Ʒ� ��û ��Ȳ ������ ����¡ 
	
	public int careProdelete(int cno)throws Exception;					// ��ϵ� �Ʒ� ����
	
	// �Ǹ���
	public List<CustomVO> customSel(Criteria cri)throws Exception;		// �Ǹ��� ��ǰ ��Ȳ
	public int customCount(Criteria cri)throws Exception;				// �Ǹ��� ��ǰ ��Ȳ ����¡

	public List<BillVO> billSel(Criteria cri)throws Exception;			// �Ǹ� ��û ��Ȳ
	public int billCount(Criteria cri)throws Exception;					// �Ǹ� ��û ��Ȳ ����¡
	
	public boolean bill_update(int bno)throws Exception;				// �Ǹ� ����
	
	public List<BillVO> billComit(Criteria cri)throws Exception;		// �Ǹ��� ���� ��Ȳ
	public int billComitCount(Criteria cri)throws Exception;			// �Ǹ��� ���� ����¡
} // class
