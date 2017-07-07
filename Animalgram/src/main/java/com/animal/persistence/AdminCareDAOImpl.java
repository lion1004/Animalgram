package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.CareVO;
import com.animal.domain.SearchCriteria;

@Repository
public class AdminCareDAOImpl implements AdminCareDAO {
	
	@Inject
	SqlSession session;
	
	public List<CareVO> listCare(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return session.selectList("adminCare.listCare",cri,row);
	}

	public int careCount(SearchCriteria cri) {
		return session.selectOne("adminCare.careCount",cri);
	}

	public int deleteCare(List<Integer> list) {
		return session.delete("adminCare.deleteCare",list);
	}

	public CareVO selectCare(int cno) {
		return session.selectOne("adminCare.selectCare",cno);
	}

	public int updateCare(CareVO vo) {
		return session.update("adminCare.updateCare",vo);
	}

}
