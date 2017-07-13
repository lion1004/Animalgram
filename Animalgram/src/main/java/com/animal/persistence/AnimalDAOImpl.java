	package com.animal.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.AgroupVO;
import com.animal.domain.AnimalVO;
import com.animal.domain.BillVO;
import com.animal.domain.CareProVO;
import com.animal.domain.CareVO;
import com.animal.domain.Criteria;
import com.animal.domain.CustomVO;
import com.animal.domain.ProfessionalVO;
import com.animal.domain.SellerVO;

@Repository
public class AnimalDAOImpl implements AnimalDAO {

	@Inject
	private SqlSession sql;
	
	@Override
	public void animalInsert(AnimalVO vo) throws Exception {	// ���� �� ���
		sql.insert("member.petinsert",vo);
	}

	@Override
	public List<AnimalVO> selectAni(String nickname) throws Exception {	// �� ������� �ҷ�����
		return sql.selectList("member.petselect",nickname);
	}

	@Override
	public void proInsert(ProfessionalVO vo) throws Exception {			// ������ ����ϱ�
		sql.insert("member.proinsert",vo);
		
	}

	@Override
	public void promember(Map<String, Object> map) throws Exception {	// ������ ����ϱ�_job ������Ʈ
		sql.update("member.proinsert_up",map);
	} 
	
	@Override
	public void selInsert(SellerVO vo) throws Exception {				// �Ǹ��� ����ϱ�
		sql.insert("member.sellinsert",vo);
	}

	@Override
	public List<AgroupVO> selectAgroup(Criteria cri) throws Exception {	// �Ҹ��� ��Ȳ ��ȸ
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sql.selectList("mypage.agroup",cri,bounds);
	}

	@Override
	public int agroupCount(Criteria cri) throws Exception {				// �Ҹ��� ����¡
		return sql.selectOne("mypage.agroup_count",cri);
	}

	@Override
	public List<CareVO> selectCare(Criteria cri) throws Exception {		// �Ʒ� ��Ȳ ��ȸ
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.care",cri,bounds);
	}

	@Override
	public int careCount(Criteria cri) throws Exception {				// �Ʒ�  ��Ȳ ����¡
		return sql.selectOne("mypage.care_count",cri);
	}

	@Override
	public boolean caredelete(int cano) throws Exception {				// �Ʒ� ����
		if(sql.delete("mypage.care_user_delete",cano) == 1){
			return true;
		}else
			return false;
	}
	
	@Override
	public List<CareProVO> carePro(Criteria cri) throws Exception {				// �Ʒ� ��Ȳ ��û ��ȸ ��������
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.care_pro",cri,bounds);
	}

	@Override
	public int careProCount(Criteria cri) throws Exception {					// ���� ��Ȳ ��û ��ȸ �������� ����¡
		return sql.selectOne("mypage.care_pro_count",cri);
	}

	@Override
	public List<CareProVO> careProComit(Criteria cri) throws Exception {				// �Ʒ� ��Ȳ ��û ���� ��ȸ ��������
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.care_pro_comit",cri,bounds);
	}
	
	@Override
	public int careProCountComit(Criteria cri) throws Exception {					// ���� ��Ȳ ��û ��ȸ ���� �������� ����¡
		return sql.selectOne("mypage.care_pro_count_cmit",cri);
	}
	
	@Override
	public boolean careProUPdate(int cano) throws Exception {				// ���� ��Ȳ ��û ���� ��������
		if(sql.update("mypage.update_care",cano) == 1){
			return true;
		}else
			return false;
	}
	
	@Override
	public List<CareProVO> careProSelect(Criteria cri) throws Exception {		// �Ʒ� ��Ȳ ��ȸ(��������)
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.care_pro_select",cri,bounds);
	}

	@Override
	public int careProSelCount(Criteria cri) throws Exception {				// �Ʒ� ��Ȳ ����¡
		return sql.selectOne("mypage.care_pro_select_count",cri);
	}

	@Override
	public int careProdelete(int cno) throws Exception {		// ��ϵ� �Ʒ� ����
		return sql.delete("mypage.delete_care_pro",cno);
	}

	@Override
	public List<CustomVO> customSel(Criteria cri) throws Exception {	// �Ǹ� ��ǰ ��Ȳ ��ȸ
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.custom_select",cri,bounds);
	}

	@Override
	public int customCount(Criteria cri) throws Exception {				// �Ǹ� ��ǰ ��Ȳ ��ȸ ����¡
		return sql.selectOne("mypage.custom_page",cri);
	}

	@Override
	public List<BillVO> billSel(Criteria cri) throws Exception {		// �Ǹ� ��û
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.bill_select",cri,bounds);
	}

	@Override
	public int billCount(Criteria cri) throws Exception {				// �Ǹ� ��û ����¡
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
	public List<BillVO> billComit(Criteria cri) throws Exception {		// �Ǹ� ��û ����
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return sql.selectList("mypage.bill_comit_select",cri,bounds);
	}

	@Override
	public int billComitCount(Criteria cri) throws Exception {			// �Ǹ� ��û ���� ����¡
		return sql.selectOne("mypage.bill_comit_count",cri);
	}

}
