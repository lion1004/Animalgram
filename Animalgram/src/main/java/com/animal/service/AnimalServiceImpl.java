package com.animal.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.AgroupVO;
import com.animal.domain.AnimalVO;
import com.animal.domain.BillVO;
import com.animal.domain.CareProVO;
import com.animal.domain.CareVO;
import com.animal.domain.Criteria;
import com.animal.domain.CustomVO;
import com.animal.domain.ProfessionalVO;
import com.animal.domain.SellerVO;
import com.animal.persistence.AnimalDAO;

@Service
public class AnimalServiceImpl implements AnimalService {

	@Inject
	private AnimalDAO dao;
	
	@Override
	public void insertAni(AnimalVO vo) throws Exception {	// ���� �� ���
		dao.animalInsert(vo);
	}	// class

	@Override
	public List<AnimalVO> selecAni(String nickname) throws Exception {	// �� ��� �ҷ�����
		return dao.selectAni(nickname);
	}

	@Override
	public void insertPro(ProfessionalVO vo,Map<String,Object> map) throws Exception {	// ������ ���
		dao.proInsert(vo);
		dao.promember(map);
	}

	@Override
	public void insertSel(SellerVO vo) throws Exception {		// �Ǹ��� ���
		dao.selInsert(vo);
	}

	@Override
	public List<AgroupVO> agroupList(Criteria cri) throws Exception {	// �Ҹ��� ��Ȳ
		return dao.selectAgroup(cri);
	}

	@Override
	public int agroupCount(Criteria cri) throws Exception {				// �Ҹ��� ��Ȳ(����¡)
		return dao.agroupCount(cri);
	}

	@Override
	public List<CareVO> careList(Criteria cri) throws Exception {		// �Ʒ� ��Ȳ
		return dao.selectCare(cri);
	}

	@Override
	public int careCount(Criteria cri) throws Exception {				// �Ʒ� ��Ȳ(����¡)
		return dao.careCount(cri);
	}

	@Override
	public boolean careUserDel(int cano) throws Exception {			// �Ʒ� ����
		return dao.caredelete(cano);
	}
	
	@Override
	public List<CareProVO> procare(Criteria cri) throws Exception {		// �Ʒ� ��Ȳ ��û ��ȸ ��������
		return dao.carePro(cri);
	}

	@Override
	public int careProcount(Criteria cri) throws Exception {		// �Ʒ� ��Ȳ ��û ��ȸ �������� ����¡
		return dao.careProCount(cri);
	}
	
	@Override
	public List<CareProVO> procareComit(Criteria cri) throws Exception {		// �Ʒ� ��Ȳ ����
		return dao.careProComit(cri);
	}

	@Override
	public int careProcountComit(Criteria cri) throws Exception {				// �Ʒ� ��Ȳ ���� ����¡
		return dao.careProCountComit(cri);
	}
	
	@Override
	public boolean careProUp(int cano) throws Exception {			// �Ʒ� ��Ȳ ��û ���� ��������
		return dao.careProUPdate(cano);
	}

	@Override
	public List<CareProVO> procareSelect(Criteria cri) throws Exception {	// �Ʒ� ��Ȳ ��ȸ ��������
		return dao.careProSelect(cri);
	}

	@Override
	public int careProSelcount(Criteria cri) throws Exception {			// �Ʒ� ��Ȳ ��ȸ �������� ����¡
		return dao.careProSelCount(cri);
	}

	@Override
	public int careProdelete(int cno) throws Exception {			// �Ʒ� ��Ȳ ����
		return dao.careProdelete(cno);
	}

	@Override
	public List<CustomVO> customSelect(Criteria cri) throws Exception {		// �Ǹ� ��Ȳ ��ȸ
		return dao.customSel(cri);
	}

	@Override
	public int customPage(Criteria cri) throws Exception {				// �Ǹ� ��Ȳ ����¡
		return dao.customCount(cri);
	}

	@Override
	public List<BillVO> billSelect(Criteria cri) throws Exception {		// �Ǹ� ��û ��ȸ
		return dao.billSel(cri);
	}

	@Override
	public int billCount(Criteria cri) throws Exception {			// �Ǹ� ��û ����¡
		return dao.billCount(cri);
	}

	@Override
	public boolean bill_update(int bno) throws Exception {			// �Ǹ� ��û ����
		return dao.bill_update(bno);
	}
	
	@Override
	public List<BillVO> billComit(Criteria cri) throws Exception {		// �Ǹ� ���� ��ȸ
		return dao.billComit(cri);
	}

	@Override
	public int billComitCount(Criteria cri) throws Exception {			// �Ǹ� ���� ����¡
		return dao.billComitCount(cri);
	}

}
