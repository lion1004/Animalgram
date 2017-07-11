package com.animal.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession sqlsession;
	@Override
	public void rinsert(ReplyVO vo) throws Exception {		// ´ñ±Û Ãß°¡
		sqlsession.insert("areply.rinsert",vo);
	}

	@Override
	public void rupdate(ReplyVO vo) throws Exception {		// ´ñ±Û ¼öÁ¤
		sqlsession.update("areply.rupdate",vo);
	}

	@Override
	public void rremove(int arno) throws Exception {		// ´ñ±Û »èÁ¦
		sqlsession.delete("areply.rremove", arno);
	}
	
	@Override
	public ReplyVO rread(int arno) throws Exception {		// ´ñ±Û ÇÑ ÁÙ ÀÐ¾î¿À±â
		return sqlsession.selectOne("areply.rread",arno);
	}

	@Override
	public List<ReplyVO> rlist(int antno, int start, int end) throws Exception {	// ´ñ±Û ¸ñ·Ï Ãâ·Â
		Map<String, Object> map = new HashMap<>();
		map.put("antno",antno);
		map.put("start",start);
		map.put("end", end);
		return sqlsession.selectList("areply.listareply",map);
	}
	@Override
	public int rcount(int antno) throws Exception {					// ´ñ±Û ÀüÃ¼ °¹¼ö(ÆäÀÌÂ¡)
		return sqlsession.selectOne("areply.rcount", antno);
	}


}
