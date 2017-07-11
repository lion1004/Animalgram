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
public class KnowhowDAOImpl implements KnowhowDAO {

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public int kinsert(NoticeTextVO vo) throws Exception {		// 게시글 추가
		return sqlsession.insert("notice.kinsert", vo);
	}

	@Override
	public void kupdate(NoticeTextVO vo) throws Exception {		// 게시글 수정
		sqlsession.update("notice.nupdate",vo);
	}

	@Override
	public void kremove(Map<String, Object> map) throws Exception {		// 게시글 삭제
		sqlsession.delete("notice.nremove", map);
	}

	@Override
	public NoticeTextVO kread(Map<String, Object> map) throws Exception {	// 게시글 한 행 검색
		/*sqlsession.update("notice.ncount",map);*/
		return sqlsession.selectOne("notice.nread", map);
	}

	@Override
	public List<NoticeTextVO> klist(SearchCriteria cri)throws Exception{	// 게시글 전체 리스트 출력
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlsession.selectList("notice.klist", cri, bounds);
	}
	
	@Override
	public int klistcount(SearchCriteria cri)throws Exception{				// 전체 게시글 갯수
		return sqlsession.selectOne("notice.klistcount",cri);
	}

	@Override
	public void kcount(Map<String, Object> map) throws Exception {		// 조회수 중복방지
		sqlsession.update("notice.ncount",map);
	}
}