package com.animal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.BlacklistVO;
import com.animal.domain.MemberVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.AdminMemberDAO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Inject
	AdminMemberDAO dao;
	
	@Override
	public MemberVO adminLogin(String idmail, String mpass) {
		return dao.adminLogin(idmail, mpass);
	}

	@Override
	public List<MemberVO> listMember(SearchCriteria cri) {
		return dao.listMember(cri);
	}

	@Override
	public int memberCount(SearchCriteria cri) {
		return dao.memberCount(cri);
	}

	@Override
	public MemberVO selectMember(int mno) {
		return dao.selectMember(mno);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return dao.updateMember(vo);
	}

	@Override
	public int deleteMember(List<Integer> list) {
		return dao.deleteMember(list);
	}

	@Override
	public int addBlack(BlacklistVO vo) {
		return dao.addBlack(vo);
	}

	@Override
	public boolean checkBlack(int mno) {
		return dao.checkBlack(mno);
	}

	@Override
	public List<BlacklistVO> checkBlackList(List<Integer> list) {
		return dao.checkBlackList(list);
	}

	@Override
	public List<BlacklistVO> listBlack(SearchCriteria cri) {
		return dao.listBlack(cri);
	}

	@Override
	public int blackCount(SearchCriteria cri) {
		return dao.blackCount(cri);
	}

	@Override
	public int deleteBlack(List<Integer> list) {
		return dao.deleteBlack(list);
	}

	@Override
	public int todayUser() {
		return dao.todayUser();
	}

}
