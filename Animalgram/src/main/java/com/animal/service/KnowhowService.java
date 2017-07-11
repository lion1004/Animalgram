package com.animal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;

public interface KnowhowService {
	public int kinsert(NoticeTextVO vo)throws Exception;			// �Խñ� �ۼ�
	public void kupdate(NoticeTextVO vo)throws Exception;			// �Խñ� ����
	public void kremove(Map<String, Object> map)throws Exception;	// �Խñ� ����
	
	public NoticeTextVO kread(Map<String, Object> map)throws Exception;		// �Խñ� �ϳ� �о����
	public void kcount(Map<String, Object> map, HttpSession session) throws Exception;	// �Խñ� ��ȸ��(�ߺ�����)
	
	public List<NoticeTextVO> klist(SearchCriteria cri) throws Exception;	// �Խñ� ���
	public int klistcount(SearchCriteria cri) throws Exception;		// �Խñ� �� ����(����¡)
}