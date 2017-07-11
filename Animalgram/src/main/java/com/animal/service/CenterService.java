package com.animal.service;

import java.util.List;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.Criteria;

public interface CenterService {
	public int cinsert(CenterVO vo) throws Exception;	// ������ �Խñ� �Է�
	public CenterVO cread(int ctno)throws Exception;//������ �Խñ� �� ����
	public  List<CenterReplyVO> creply(int ctno)throws Exception;
	public List<CenterVO> clist(Criteria cri)throws Exception;// ������ �Խñ� ��ü ����
	public int clistcount(Criteria cri) throws Exception;
}
