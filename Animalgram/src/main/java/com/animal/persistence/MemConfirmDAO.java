package com.animal.persistence;

import java.util.Map;

import com.animal.domain.MemConfirmVO;

public interface MemConfirmDAO {

	public void memInsert(MemConfirmVO vo)throws Exception;	// ȸ������
	public String memIdCheck(String id)throws Exception;	// �ߺ�Ȯ��
	public String nickCheck(String nickname)throws Exception;	// �г��� �ߺ�Ȯ��
	public String idFound(MemConfirmVO vo)throws Exception;		// ���̵� ã��
	public int login(Map<String,Object> map)throws Exception;	// �α��� �ϱ�
	
	public boolean memUpdate(MemConfirmVO vo)throws Exception; // ȸ����������
	
	public String loginsession(String idmail)throws Exception;	// ��������
	
	public int selectPass(Map<String,Object> map)throws Exception;	// ��й�ȣ ã��(�����ڵ�)
	public boolean updatePass(Map<String,Object> map)throws Exception;	// ��й�ȣ ����
	
	public MemConfirmVO meminfo(String nickname)throws Exception;	// ��� ���� �ҷ�����
	
	public String selectPro(String nickname)throws Exception;		// ������ ��ȸ
	
} // class
