package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.Criteria;

@Repository
public class CenterDAOImpl implements CenterDAO {
	
	@Inject
	SqlSession sqlsession;
	
	@Override
	public int cinsert(CenterVO vo) throws Exception {// 고객센터 게시글 입력
		return sqlsession.insert("center.cinsert",vo);
	}
	
	@Override
	public CenterVO cread(int ctno) {// 고객센터 상세 글 보기
		return sqlsession.selectOne("center.cread",ctno);
	}
	
	@Override
	public int cupdate(int ctno) throws Exception { //상태 업데이트
		return sqlsession.update("center.cupdate",ctno);
	}
	@Override
	public List<CenterReplyVO> creply(int ctno) throws Exception {
		return sqlsession.selectList("center.creply",ctno);
	}
	
	@Override
	public List<CenterVO> clist(Criteria cri) {// 고객센터 전체글 보기
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlsession.selectList("center.clist",cri,bounds);
	}
	
	@Override
	public int clistcount(Criteria cri) throws Exception {
		return sqlsession.selectOne("center.clistcount",cri);
	}



}