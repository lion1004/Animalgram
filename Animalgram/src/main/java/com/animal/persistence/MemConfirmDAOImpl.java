package com.animal.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.animal.domain.MemConfirmVO;

@Repository
public class MemConfirmDAOImpl implements MemConfirmDAO {
	
	@Inject
	private SqlSession sql;

	@Override
	public void memInsert(MemConfirmVO vo) { // 회원가입
		sql.insert("member.insert",vo);
	} // class

	@Override
	public String memIdCheck(String id) throws Exception {	// 아이디 중복확인
		return sql.selectOne("member.idcheck",id);
	}

	@Override
	public String nickCheck(String nickname) throws Exception {	// 닉네임 중복확인
		return sql.selectOne("member.nickcheck",nickname);
	}

	@Override
	public String idFound(MemConfirmVO vo) throws Exception {	// 아이디 찾기
		return sql.selectOne("member.findId",vo);
	}

	@Override
	public int login(Map<String, Object> map) throws Exception {	// 로그인 하기
		return sql.selectOne("member.login",map);
	}

	@Override
	public String loginsession(String idmail) throws Exception {	// 세션 유지
		return sql.selectOne("member.loginsession",idmail);
	}

	@Override
	public int selectPass(Map<String, Object> map) throws Exception {
		return sql.selectOne("member.selectpass",map);
	}

	@Override
	public boolean updatePass(Map<String, Object> map) throws Exception {
		int t = sql.update("member.updatepass",map);
		if(t == 1){
			return true;
		}else
			return false;
	}

}
