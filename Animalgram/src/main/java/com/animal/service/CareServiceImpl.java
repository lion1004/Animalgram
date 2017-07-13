package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.CareAskVO;
import com.animal.domain.CareVO;
import com.animal.domain.MemberVO;
import com.animal.domain.ProfessionalVO;
import com.animal.persistence.CareDAO;

@Service
public class CareServiceImpl implements CareService {

	@Inject
	CareDAO dao;

	@Override
	public void insert(CareVO vo) {
		dao.insert(vo);
	}

	@Override
	public int selectAll() {
		return 0;
	}

	@Override
	public List<CareVO> selectTen() {
		return dao.selectTen();
	}

	@Override
	public List<MemberVO> selectProm() {
		return dao.selectProm();	
	}

	@Override
	public List<ProfessionalVO> selectProp() {
		return dao.selectProp();
	}

	@Override
	public CareVO selectCareInfoc(int cno) {
		return dao.selectCareInfoc(cno);
	}

	@Override
	public ProfessionalVO selectCareInfop(int cno) {
		return dao.selectCareInfop(cno);
	}

	@Override
	public MemberVO selectCareInfom(int cno) {
		return dao.selectCareInfom(cno);
	}

	@Override
	public void update(CareVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int gno) {
		dao.delete(gno);
	}

	@Override
	public void insertCareAsk(CareAskVO vo) {
		dao.insertCareAsk(vo);
	}

	@Override
	public void deletePerGroup(int cano) {
		dao.deletePerGroup(cano);
	}

	@Override
	public CareAskVO selectPerGroOne(int cano) {
		return dao.selectPerGroOne(cano);
	}

	@Override
	public List<CareAskVO> selectCareAll() {
		return dao.selectCareAll();
	}

	@Override
	public List<CareAskVO> selectPerson(int mno) {
		return dao.selectPerson(mno);
	}

	@Override
	public List<CareAskVO> selectCareAsk(int cno) {
		return dao.selectCareAsk(cno);
	}
}
