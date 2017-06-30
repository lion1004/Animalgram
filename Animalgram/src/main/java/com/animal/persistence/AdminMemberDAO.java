package com.animal.persistence;

import java.util.List;

import com.animal.domain.BlacklistVO;
import com.animal.domain.MemberVO;
import com.animal.domain.SearchCriteria;

public interface AdminMemberDAO {
	
	public MemberVO adminLogin(String idmail,String mpass);
	
	public List<MemberVO> listMember(SearchCriteria cri);
	public int memberCount(SearchCriteria cri);
	public MemberVO selectMember(int mno);
	
	public int updateMember(MemberVO vo);
	public int deleteMember(List<Integer> list);
	
	public int addBlack(BlacklistVO vo);
	public boolean checkBlack(int mno);
	public List<BlacklistVO> checkBlackList(List<Integer> list);
	
	public List<BlacklistVO> listBlack(SearchCriteria cri);
	public int blackCount(SearchCriteria cri);
    public int deleteBlack(List<Integer> list);
	
	public int todayUser();
}
