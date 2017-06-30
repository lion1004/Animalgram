package com.animal.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.BlacklistVO;
import com.animal.domain.MemberVO;
import com.animal.domain.SearchCriteria;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	
	@Inject
	SqlSession session;
	
	public MemberVO adminLogin(String idmail, String mpass) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("idmail", idmail);
		map.put("mpass", mpass);
		return session.selectOne("adminMember.adminLogin",map);
	}

	public List<MemberVO> listMember(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return session.selectList("adminMember.listMember",cri,row);
	}
	public int memberCount(SearchCriteria cri) {
		return session.selectOne("adminMember.memberCount",cri);
	}
	public MemberVO selectMember(int mno){
		return session.selectOne("adminMember.selectMember", mno);
	}
	
	public int todayUser(){
		return session.selectOne("adminMember.todayUser");
	}

	public int updateMember(MemberVO vo) {
		return session.update("adminMember.updateMember",vo);
	}
	public int deleteMember(List<Integer> list) {
		return session.delete("adminMember.deleteMember",list);
	}
	public int addBlack(BlacklistVO vo) {
		return session.insert("adminMember.addBlack",vo);
	}
	public boolean checkBlack(int mno) {
		Object t = session.selectOne("adminMember.checkBlack",mno);
		if(t==null){
			return false;
		}
		
		return true; //블랙리스트에 있음
	}
	
	public List<BlacklistVO> checkBlackList(List<Integer> list) {
		return session.selectList("adminMember.checkBlackList",list);
	}

	public List<BlacklistVO> listBlack(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return session.selectList("adminMember.listBlack",cri,row);
	}
	public int blackCount(SearchCriteria cri) {
		return session.selectOne("adminMember.blackCount",cri);
	}

	public int deleteBlack(List<Integer> list) {
		return session.delete("adminMember.deleteBlack",list);
	}

	

}
