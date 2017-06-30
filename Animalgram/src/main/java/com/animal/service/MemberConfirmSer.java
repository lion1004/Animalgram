package com.animal.service;

import java.util.Map;

import com.animal.domain.MemConfirmVO;

public interface MemberConfirmSer {

	public void regist(MemConfirmVO vo)throws Exception;	// 회원가입
	public String memIdCheck(String id)throws Exception;	// 중복확인
	public String nickCheck(String nickname)throws Exception;	// 닉네임 중복확인
	public String foundId(MemConfirmVO vo)throws Exception;		// 아이디 찾기
	public int login(Map<String,Object> map)throws Exception;	// 로그인 하기
	
	public String loginsession(String idmail)throws Exception;	// 세션유지
	public int selectPass(Map<String,Object> map)throws Exception;	// 비밀번호 찾기
	public boolean updatePass(Map<String,Object> map)throws Exception;	// 비밀번호 변경
} // class
