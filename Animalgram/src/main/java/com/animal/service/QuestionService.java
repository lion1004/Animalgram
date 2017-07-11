package com.animal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;

public interface QuestionService {
	public int qinsert(NoticeTextVO vo)throws Exception;			// �Խñ� �ۼ�
	public void qupdate(NoticeTextVO vo)throws Exception;			// �Խñ� ����
	public void qremove(Map<String, Object> map)throws Exception;	// �Խñ� ����
	
	public NoticeTextVO qread(Map<String, Object> map)throws Exception;		// �Խñ� �ϳ� �о����
	public void qcount(Map<String, Object> map, HttpSession session) throws Exception;	// �Խñ� ��ȸ��(�ߺ�����)
	
	public List<NoticeTextVO> qlist(SearchCriteria cri) throws Exception;	// �Խñ� ���
	public int qlistcount(SearchCriteria cri) throws Exception;		// �Խñ� �� ����(����¡)
}