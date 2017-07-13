package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.SearchCriteria;

@Repository
public class AdminCenterDAOImpl implements AdminCenterDAO{

	@Inject
	SqlSession session;
	
	public List<CenterVO> listCenter(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return session.selectList("adminCenter.listCenter",cri,row);
	}

	public int centerCount(SearchCriteria cri) {
		return session.selectOne("adminCenter.centerCount",cri);
	}

	public CenterVO selectCenter(int ctno) {
		return session.selectOne("adminCenter.selectCenter",ctno);
	}

	public int deleteCenter(int ctno) {
		return session.delete("adminCenter.deleteCenter",ctno);
	}
	
	public List<CenterReplyVO>selectReply(int ctno) {
		return session.selectList("adminCenter.selectCenterReply",ctno);
	}
	public int insertReply(CenterReplyVO vo) {
		System.out.println("vo::"+vo);
		return session.insert("adminCenter.addCenterReply",vo);
	}

	public int updateReply(CenterReplyVO vo) {
		return session.update("adminCenter.updateCenterReply",vo);
	}

	public int deleteReply(int ctno) {
		return session.delete("adminCenter.deleteCenterReply",ctno);
	}


}
