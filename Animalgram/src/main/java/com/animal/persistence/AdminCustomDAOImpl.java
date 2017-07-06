package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

@Repository
public class AdminCustomDAOImpl implements AdminCustomDAO {

	@Inject
	SqlSession session;
	
	public List<CustomVO> listCustom(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return session.selectList("adminCustom.listCustom",cri,row);
	}

	public int customCount(SearchCriteria cri) {
		return session.selectOne("adminCustom.customCount",cri);
	}

	public int deleteCustom(List<Integer> list) {
		return session.delete("adminCustom.deleteCustom",list);
	}

	public CustomVO selectCustom(int cuno) {
		return session.selectOne("adminCustom.selectCustom",cuno);
	}

	public int updateCustom(CustomVO vo) {
		return session.update("adminCustom.updateCustom",vo);
	}

}
