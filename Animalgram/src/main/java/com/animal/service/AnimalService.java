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

	public void insertAni(AnimalVO vo)throws Exception;	// �� ���
	public List<AnimalVO> selecAni(String nickname)throws Exception;	// �� ���

	public void insertPro(ProfessionalVO vo,Map<String,Object> map)throws Exception;	// ������ ���
	public void insertSel(SellerVO vo)throws Exception;			// �Ǹ��� ���
	
	public List<AgroupVO> agroupList(Criteria cri)throws Exception;	// �Ҹ��� ��Ȳ ���
	public int agroupCount(Criteria cri)throws Exception;		// �Ҹ��� ����(����¡)
	
	public List<BillUserVO> customUser(Criteria cri)throws Exception;	// �Ǹ� ��Ȳ ��ȸ
	public int customUCount(Criteria cri)throws Exception;				// �Ǹ� ��Ȳ ��ȸ ����¡
	public boolean customUdel(int bno)throws Exception;			// �Ǹ� ��Ȳ ����
	
	public List<CareVO> careList(Criteria cri)throws Exception;	// �Ʒ� ��Ȳ ��ȸ
	public int careCount(Criteria cri)throws Exception;			// �Ʒ� ��Ȳ ��ȸ(����¡)

	public boolean careUserDel(int cano)throws Exception;		// �Ʒ� ����
	
	public List<DonationVO> donation_now(Criteria cri)throws Exception;	// ���� ��Ȳ �ø����
	public int donation_now_count(Criteria cri)throws Exception;	// ���� ��Ȳ ����¡
	public boolean donation_del(int dno)throws Exception;			// ���� ��� ����
	
	public List<DonationCheckVO> donationCheck(Criteria cri)throws Exception;	// ���� ��Ȳ ��÷��
	public int donationCheckCount(Criteria cri)throws Exception;	// ���� ��Ȳ ��÷�� ����¡
	
	public boolean donationUp(int dano)throws Exception;			// ���� ����

	public List<DonationCheckVO> donationCheckOk(Criteria cri)throws Exception;	// ���� ��Ȳ �Ϸ�
	public int donationCheckCountOK(Criteria cri)throws Exception;	// ���� ��Ȳ �Ϸ� ����¡
	
	// ��������
	public List<CareProVO> procare(Criteria cri)throws Exception;	// �Ʒ� ��Ȳ ��û ��������
	public int careProcount(Criteria cri)throws Exception;			// �Ʒ� ��Ȳ ��û �������� ����¡

	public List<CareProVO> procareComit(Criteria cri)throws Exception;	// �Ʒ� ��Ȳ ��û ��������
	public int careProcountComit(Criteria cri)throws Exception;			// �Ʒ� ��Ȳ ��û �������� ����¡
	
	public boolean careProUp(int cano)throws Exception;		// �Ʒ� ��Ȳ ��û ����

	public List<CareProVO> procareSelect(Criteria cri)throws Exception;	// �Ʒ� ��Ȳ ��������
	public int careProSelcount(Criteria cri)throws Exception;			// �Ʒ� ��Ȳ �������� ����¡
	
	public int careProdelete(int cno)throws Exception;				// �Ʒ� ��Ȳ ����(��������)
	

	// �Ǹ��ڿ�
	public List<CustomVO> customSelect(Criteria cri)throws Exception;	// �Ǹ� ��Ȳ ��ȸ
	public int customPage(Criteria cri)throws Exception;			// �Ǹ� ��Ȳ ��ȸ ����¡
		
	public List<BillVO> billSelect(Criteria cri)throws Exception;		// �Ǹ� ��û ��ȸ
	public int billCount(Criteria cri)throws Exception;					// �Ǹ� ��û ����¡
	
	public boolean bill_update(int bno)throws Exception;			// �Ǹ� ��û ����
	
	public List<BillVO> billComit(Criteria cri)throws Exception;		// �Ǹ� ���� ��ȸ
	public int billComitCount(Criteria cri)throws Exception;			// �Ǹ� ���� ����¡

} // class
