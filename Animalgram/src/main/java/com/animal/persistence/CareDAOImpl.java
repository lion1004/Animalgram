package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.CareVO;
import com.animal.domain.MemberVO;
import com.animal.domain.ProfessionalVO;

@Repository
public class CareDAOImpl implements CareDAO {

	@Inject
	private SqlSession session;

	@Override
	public void insert(CareVO vo) {
		session.insert("care.insertCare", vo);
	}

	@Override
	public int selectAll() {
		return session.selectOne("");
	}

	@Override
	public List<MemberVO> selectProm() {
		return session.selectList("care.selectProm");
	}

	@Override
	public List<ProfessionalVO> selectProp() {
		return session.selectList("care.selectProp");
	}

	@Override
	public List<CareVO> selectTen() {
		return session.selectList("care.selectCalList");
	}

	@Override
	public CareVO selectCareInfoc(int cno) {
		return session.selectOne("care.selectCareInfoc", cno);
	}

	@Override
	public ProfessionalVO selectCareInfop(int cno) {
		return session.selectOne("care.selectCareInfop", cno);
	}

	@Override
	public MemberVO selectCareInfom(int cno) {
		return session.selectOne("care.selectCareInfom", cno);
	}

	@Override
	public void update(CareVO vo) {
		session.update("updateGroup", vo);
	}

	@Override
	public void delete(int gno) {
		session.delete("deleteGroup", gno);
	}

}
