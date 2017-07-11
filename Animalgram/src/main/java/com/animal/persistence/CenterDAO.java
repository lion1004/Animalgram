package com.animal.persistence;

import java.util.List;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.Criteria;

public interface CenterDAO {
	public int cinsert(CenterVO vo)throws Exception; // ������ �Խñ� �Է�
	public CenterVO cread(int ctno)throws Exception;//������ �� �� ����
	public int cupdate(int ctno)throws Exception;//���� ������Ʈ
	public List<CenterReplyVO> creply(int ctno)throws Exception;
	public List<CenterVO> clist(Criteria cri)throws Exception;//������ ��ü�� ����
	public int clistcount(Criteria cri)throws Exception;
}