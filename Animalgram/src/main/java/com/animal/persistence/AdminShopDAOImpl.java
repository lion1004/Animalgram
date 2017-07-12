package com.animal.persistence;

	import java.util.HashMap;
	import java.util.List;
	import java.util.Map;

	import javax.inject.Inject;

	import org.apache.ibatis.session.RowBounds;
	import org.apache.ibatis.session.SqlSession;
	import org.springframework.stereotype.Repository;

	import com.animal.domain.Criteria;
	import com.animal.domain.SearchCriteria;
	import com.animal.domain.ShopVO;
	

	@Repository
	public class AdminShopDAOImpl implements AdminShopDAO{

		@Inject
		private SqlSession sqlSession;//SQL문 실행할수있도록!!!
		@Override
		public void insert(ShopVO vo) {//추가
			sqlSession.insert("shop.insert",vo);
		}

		

		@Override
		public void delete(int shno) {//삭제
			sqlSession.delete("shop.delete",shno);
		}

		@Override
		public ShopVO select(int shno) {//한개 조회
			
			return sqlSession.selectOne("shop.select",shno);
		}

		@Override
		public List<ShopVO> selectAll(){//전체리스트조회
			
			return sqlSession.selectList("shop.selectAll");
		}

		@Override
		public List<ShopVO> listCriteria(Criteria cri) throws Exception {
			RowBounds bounds=new RowBounds(cri.getPageStart(),cri.getPerPageNum());
			
			return sqlSession.selectList("shop.listPage",cri,bounds);
		}

		@Override
		public int countPaging(Criteria cri) throws Exception {
			
			return sqlSession.selectOne("shop.count");
		}

		@Override
		public int listSearchCount(SearchCriteria cri) throws Exception {
					
			return sqlSession.selectOne("shop.listSearchCount",cri);
		}

		@Override
		public List<ShopVO> listSearch(SearchCriteria cri) throws Exception {
			RowBounds bounds=new RowBounds(cri.getPageStart(),cri.getPerPageNum());
			return sqlSession.selectList("shop.listSearch",cri,bounds);
		}

		@Override
		public void update(ShopVO vo) throws Exception {
			
			

			
			sqlSession.update("shop.update",vo);
			
		}

		

	}
