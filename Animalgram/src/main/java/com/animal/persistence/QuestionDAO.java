package com.animal.persistence;

import java.util.List;
import java.util.Map;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;


public interface QuestionDAO {
	public int qinsert(NoticeTextVO vo)throws Exception;	//�Խñ� �߰�
	public void qupdate(NoticeTextVO vo)throws Exception;	//�Խñ� ����
	public void qremove(Map<String, Object> map)throws Exception;	//�Խñ� ���� ����
	
	public NoticeTextVO qread(Map<String, Object> map)throws Exception;	//�Խñ� ���� �˻�
	
	public List<NoticeTextVO> qlist(SearchCriteria cri) throws Exception;	//��ü ����Ʈ ���
	public int qlistcount(SearchCriteria cri)throws Exception;	// ��ü �Խñ� ���� 
	
	public void qcount(Map<String, Object> map) throws Exception;	// ��ȸ�� �ߺ�����
}
