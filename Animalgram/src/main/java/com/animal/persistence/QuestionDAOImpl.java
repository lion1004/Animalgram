package com.animal.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;


@Repository
public class QuestionDAOImpl implements QuestionDAO {

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public int qinsert(NoticeTextVO vo) throws Exception {		// �Խñ� �߰�
		return sqlsession.insert("notice.qinsert", vo);
	}

	@Override
	public void qupdate(NoticeTextVO vo) throws Exception {		// �Խñ� ����
		sqlsession.update("notice.nupdate",vo);
	}

	@Override
	public void qremove(Map<String, Object> map) throws Exception {		// �Խñ� ����
		sqlsession.delete("notice.nremove", map);
	}

	@Override
	public NoticeTextVO qread(Map<String, Object> map) throws Exception {	// �Խñ� �� �� �˻�
		return sqlsession.selectOne("notice.nread", map);
	}

	@Override
	public List<NoticeTextVO> qlist(SearchCriteria cri)throws Exception{	// �Խñ� ��ü ����Ʈ ���
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlsession.selectList("notice.qlist", cri, bounds);
	}
	
	@Override
	public int qlistcount(SearchCriteria cri)throws Exception{				// ��ü �Խñ� ����
		return sqlsession.selectOne("notice.qlistcount",cri);
	}

	@Override
	public void qcount(Map<String, Object> map) throws Exception {		// ��ȸ�� �ߺ�����
		sqlsession.update("notice.ncount",map);
	}
}