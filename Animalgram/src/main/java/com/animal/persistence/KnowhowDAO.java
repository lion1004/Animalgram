package com.animal.persistence;

import java.util.List;
import java.util.Map;


import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;


public interface KnowhowDAO {
	public int kinsert(NoticeTextVO vo)throws Exception;//�Խñ� �߰�
	public void kupdate(NoticeTextVO vo)throws Exception;//�Խñ� ����
	public void kremove(Map<String, Object> map)throws Exception;//�Խñ� ���� ����
	
	public NoticeTextVO kread(Map<String, Object> map)throws Exception;//�Խñ� ���� �˻�
	
	public List<NoticeTextVO> klist(SearchCriteria cri) throws Exception;//��ü ����Ʈ ���
	public int klistcount(SearchCriteria cri)throws Exception;// ��ü �Խñ� ���� 
	
	public void kcount(Map<String, Object> map) throws Exception;	// ��ȸ�� �ߺ�����
}
