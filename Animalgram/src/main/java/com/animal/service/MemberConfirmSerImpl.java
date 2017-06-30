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
	public void regist(MemConfirmVO vo) throws Exception {		// ȸ������
		dao.memInsert(vo);
	}

	@Override
	public String memIdCheck(String id) throws Exception {		// �ߺ�üũ
		return dao.memIdCheck(id);
	}

	@Override
	public String nickCheck(String nickname) throws Exception {		// �г��� �ߺ�Ȯ��
		return dao.nickCheck(nickname);
	}

	@Override
	public String foundId(MemConfirmVO vo) throws Exception {		// ���̵� ã��
		return dao.idFound(vo);
	}

	@Override
	public int login(Map<String, Object> map) throws Exception {	// �α���
		return dao.login(map);
	}

	@Override
	public String loginsession(String idmail) throws Exception {	// ��������
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