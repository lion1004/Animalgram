package com.animal.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.Criteria;
import com.animal.domain.CustomAttachVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;

@Repository
public class CustomDAOImpl implements CustomDAO {
    
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(CustomVO vo) throws Exception {
		System.out.println("customDAOImpl-vo :"+vo);
	   sqlSession.insert("custom.create", vo);
	}

	@Override
	public void update(CustomVO vo) throws Exception {
		sqlSession.update("custom.update",vo);
	}
	
	

	@Override
	public void delete(int cuno) throws Exception {
		sqlSession.delete("custom.delete", cuno);
	}

	@Override
	public CustomVO read(int cuno) throws Exception {
		return sqlSession.selectOne("custom.read", cuno);
	}

	@Override
	public List<CustomVO> listAll() throws Exception {
		return sqlSession.selectList("custom.listAll");
	}

	@Override
	public List<CustomVO> listPage(int page) throws Exception {
		//RowBounds bounds = new RowBounds(int offset, int limit);
		//offset: 시작위치(인덱스),  limit: 조회할 행의 갯수(length)
		/*
		     1페이지 - 0~9
		     2페이지 - 10~19
		     3페이지 - 20~29
		 */
		if(page < 1) page=1;
		
		page = (page-1)*10;		
		
		RowBounds bounds = new RowBounds(page, 10);
		
		return sqlSession.selectList("custom.listPage",null, bounds);
	}

	@Override
	public List<CustomVO> listCriteria(Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("custom.listPage",null, bounds);
	}
	
	@Override
	public int cucount() throws Exception {
		return sqlSession.selectOne("custom.cucount");
	}
	
	@Override
	public int countPaging() throws Exception {
		return sqlSession.selectOne("custom.countPaging");
	}

	@Override
	public List<CustomVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("custom.listSearch",cri,bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {		
		return sqlSession.selectOne("custom.listSearchCount",cri);
	}

	@Override
	public List<String> getAttach(int cuno) throws Exception {
		System.out.println("dao 임플:"+cuno);
		return sqlSession.selectList("custom.getAttach", cuno);
	}

	@Override
	public int deleteAttach(int cuno) throws Exception {
		return sqlSession.delete("deleteAttach", cuno);
	}

	@Override
	public int replaceAttach(String fullName, int cuno) throws Exception {
		  Map<String, Object> map = new HashMap<String, Object>();
		    
		    map.put("cuno", cuno);
		    map.put("fullName", fullName);
		    
		    return sqlSession.insert("replaceAttach", map);
	}

	@Override
	public int addAttach(CustomAttachVO avo) throws Exception {
		System.out.println("DAOImpl-customAttach :"+avo);
		return sqlSession.insert("custom.addAttach", avo);
	}

}



