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
	public void memInsert(MemConfirmVO vo) { // ȸ������
		sql.insert("member.insert",vo);
	} // class

	@Override
	public String memIdCheck(String id) throws Exception {	// ���̵� �ߺ�Ȯ��
		return sql.selectOne("member.idcheck",id);
	}

	@Override
	public String nickCheck(String nickname) throws Exception {	// �г��� �ߺ�Ȯ��
		return sql.selectOne("member.nickcheck",nickname);
	}

	@Override
	public String idFound(MemConfirmVO vo) throws Exception {	// ���̵� ã��
		return sql.selectOne("member.findId",vo);
	}

	@Override
	public int login(Map<String, Object> map) throws Exception {	// �α��� �ϱ�
		return sql.selectOne("member.login",map);
	}

	@Override
	public boolean memUpdate(MemConfirmVO vo) throws Exception { // ȸ����������
		int t = sql.update("member.mupdate",vo);
		if(t == 1) return true;
		else
			return false;
	}
	
	@Override
	public String loginsession(String idmail) throws Exception {	// ���� ����
		return sql.selectOne("member.loginsession",idmail);
	}

	@Override
	public int selectPass(Map<String, Object> map) throws Exception {	// ��й�ȣ ��ȸ
		return sql.selectOne("member.selectpass",map);
	}

	@Override
	public boolean updatePass(Map<String, Object> map) throws Exception {	// ��й�ȣ ����
		int t = sql.update("member.updatepass",map);
		if(t == 1){
			return true;
		}else
			return false;
	}

	@Override
	public MemConfirmVO meminfo(String nickname) throws Exception {	// ȸ������ �ҷ����� (����������)
		return sql.selectOne("member.memberinfo",nickname);
	}

	@Override
	public String selectPro(String nickname) throws Exception {		// ������ ��ȸ
		return sql.selectOne("member.selectPro",nickname);
	}


}
