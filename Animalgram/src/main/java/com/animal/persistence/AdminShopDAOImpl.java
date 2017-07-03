package com.animal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;

@Repository
public class AdminShopDAOImpl implements AdminShopDAO{
	
	@Inject
	SqlSession session;
	
	public List<ShopVO> listShop(SearchCriteria cri) {
		RowBounds row = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
		return session.selectList("adminShop.listShop",cri,row);
	}

	public int shopCount(SearchCriteria cri) {
		return session.selectOne("adminShop.shopCount",cri);
	}

	public int deleteShop(List<Integer> list) {
		return session.delete("adminShop.deleteShop",list);
	}

}
