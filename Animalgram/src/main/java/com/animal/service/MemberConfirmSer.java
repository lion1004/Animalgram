package com.animal.service;

import java.util.Map;

import com.animal.domain.MemConfirmVO;

public interface MemberConfirmSer {

	public void regist(MemConfirmVO vo)throws Exception;	// ȸ������
	public String memIdCheck(String id)throws Exception;	// �ߺ�Ȯ��
	public String nickCheck(String nickname)throws Exception;	// �г��� �ߺ�Ȯ��
	public String foundId(MemConfirmVO vo)throws Exception;		// ���̵� ã��
	public int login(Map<String,Object> map)throws Exception;	// �α��� �ϱ�
	
	public String loginsession(String idmail)throws Exception;	// ��������
	public int selectPass(Map<String,Object> map)throws Exception;	// ��й�ȣ ã��
	public boolean updatePass(Map<String,Object> map)throws Exception;	// ��й�ȣ ����
} // class
