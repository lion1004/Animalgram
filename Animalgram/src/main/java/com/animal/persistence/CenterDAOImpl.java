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
	public int cinsert(CenterVO vo) throws Exception {// ������ �Խñ� �Է�
		return sqlsession.insert("center.cinsert",vo);
	}
	
	@Override
	public CenterVO cread(int ctno) {// ������ �� �� ����
		return sqlsession.selectOne("center.cread",ctno);
	}
	
	@Override
	public int cupdate(int ctno) throws Exception { //���� ������Ʈ
		return sqlsession.update("center.cupdate",ctno);
	}
	@Override
	public List<CenterReplyVO> creply(int ctno) throws Exception {
		return sqlsession.selectList("center.creply",ctno);
	}
	
	@Override
	public List<CenterVO> clist(Criteria cri) {// ������ ��ü�� ����
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlsession.selectList("center.clist",cri,bounds);
	}
	
	@Override
	public int clistcount(Criteria cri) throws Exception {
		return sqlsession.selectOne("center.clistcount",cri);
	}



}