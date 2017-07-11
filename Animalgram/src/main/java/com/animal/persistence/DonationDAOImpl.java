package com.animal.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.Criteria;
import com.animal.domain.DonationAttachVO;
import com.animal.domain.DonationVO;
import com.animal.domain.SearchCriteria;

@Repository
public class DonationDAOImpl implements DonationDAO {
    
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(DonationVO dvo) throws Exception {
		System.out.println("donation DAOImpl :"+dvo);
	   sqlSession.insert("donation.create", dvo);
	}

	@Override
	public void update(DonationVO dvo) throws Exception {
		sqlSession.update("donation.update",dvo);
	}

	@Override
	public void delete(int dno) throws Exception {
		sqlSession.delete("donation.delete", dno);
	}

	@Override
	public DonationVO read(int dno) throws Exception {
		return sqlSession.selectOne("donation.read", dno);
	}

	@Override
	public List<DonationVO> listAll() throws Exception {
		return sqlSession.selectList("donation.listAll");
	}

	@Override
	public List<DonationVO> listPage(int page) throws Exception {
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
		
		return sqlSession.selectList("donation.listPage",null, bounds);
	}

	@Override
	public List<DonationVO> listCriteria(Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("donation.listPage",null, bounds);
	}
	
	@Override
	public int cucount() throws Exception {
		return sqlSession.selectOne("donation.cucount");
	}
	
	@Override
	public int countPaging() throws Exception {
		return sqlSession.selectOne("donation.countPaging");
	}

	@Override
	public List<DonationVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("donation.listSearch",cri,bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {		
		return sqlSession.selectOne("donation.listSearchCount",cri);
	}

/*	@Override
	public List<String> getAttach(int dno) throws Exception {
		System.out.println("dao 임플:"+dno);
		return sqlSession.selectList("donation.getAttach", dno);
	}

	@Override
	public int deleteAttach(int dno) throws Exception {
		return sqlSession.delete("deleteAttach", dno);
	}

	@Override
	public int replaceAttach(String fullName, int dno) throws Exception {
		  Map<String, Object> map = new HashMap<String, Object>();
		    
		    map.put("dno", dno);
		    map.put("fullName", fullName);
		    
		    return sqlSession.insert("replaceAttach", map);
	}

	@Override
	public int addAttach(DonationAttachVO dattachvo) throws Exception {
		System.out.println("DAOImpl-donationAttach :"+dattachvo);
		return sqlSession.insert("donation.addAttach", dattachvo);
	}*/

	@Override
	public int sellcount(DonationVO dvo) throws Exception {
		return sqlSession.update("donation.bsellcount", dvo);
	}


}



