package com.animal.persistence;

import java.util.List;

import com.animal.domain.CareVO;
import com.animal.domain.MemberVO;
import com.animal.domain.ProfessionalVO;

public interface CareDAO {
	public void insert(CareVO vo);
	public int selectAll();
	public List<CareVO> selectTen();
	public List<MemberVO> selectProm();
	public List<ProfessionalVO> selectProp();
	public CareVO selectCareInfoc(int cno);
	public ProfessionalVO selectCareInfop(int cno);
	public MemberVO selectCareInfom(int cno);
	public void update(CareVO vo);
	public void delete(int gno);
}
