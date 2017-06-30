package com.animal.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.animal.domain.MemConfirmVO;
import com.animal.persistence.MemConfirmDAO;

@Service
public class MemberConfirmSerImpl implements MemberConfirmSer{

	@Inject
	private MemConfirmDAO dao;
	
	@Override
	public void regist(MemConfirmVO vo) throws Exception {		// 회원가입
		dao.memInsert(vo);
	}

	@Override
	public String memIdCheck(String id) throws Exception {		// 중복체크
		return dao.memIdCheck(id);
	}

	@Override
	public String nickCheck(String nickname) throws Exception {		// 닉네임 중복확인
		return dao.nickCheck(nickname);
	}

	@Override
	public String foundId(MemConfirmVO vo) throws Exception {		// 아이디 찾기
		return dao.idFound(vo);
	}

	@Override
	public int login(Map<String, Object> map) throws Exception {	// 로그인
		return dao.login(map);
	}

	@Override
	public String loginsession(String idmail) throws Exception {	// 세션유지
		return dao.loginsession(idmail);
	}

	@Override
	public int selectPass(Map<String, Object> map) throws Exception {
		return dao.selectPass(map);
	}

	@Override
	public boolean updatePass(Map<String, Object> map) throws Exception {
		if(dao.updatePass(map)){
			return true;			
		}else
			return false;
	}
} // class
