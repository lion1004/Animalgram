package com.animal.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.KnowhowDAO;

@Service
public class KnowhowServiceImpl implements KnowhowService {
	
	@Inject
	private KnowhowDAO dao;
	
	@Override
	public int kinsert(NoticeTextVO vo) throws Exception {		// �Խñ� �ۼ�
		System.out.println("serv"+vo);
		return dao.kinsert(vo);
		
	}

	@Override
	public void kupdate(NoticeTextVO vo) throws Exception {		// �Խñ� ����
		dao.kupdate(vo);
	}

	@Override
	public void kremove(Map<String, Object> map) throws Exception {	// �Խñ� ����
		dao.kremove(map);
	}
	
	@Override
	public NoticeTextVO kread(Map<String, Object> map) throws Exception {	// �Խñ� �ϳ� �о����
		return dao.kread(map);
	}
	
	@Override
	public List<NoticeTextVO> klist(SearchCriteria cri) throws Exception {	// �Խñ� ���
		return dao.klist(cri);
	}

	@Override
	public int klistcount(SearchCriteria cri) throws Exception {	// �Խñ� �� ����(����¡)
		return dao.klistcount(cri);
	}

	@Override
	public void kcount(Map<String, Object> map, HttpSession session) throws Exception {	// �Խñ� ��ȸ��(�ߺ�����)
		long update_time = 0;
		// ���ǿ� ����� ��ȸ�ð� �˻�
		// ���ʷ� ��ȸ�� ��� ���ǿ� ����� ���� ���� ������ if���� ����X
		if (session.getAttribute("update_time_" + map) != null) {
			// ���ǿ��� �о����
			update_time = (long) session.getAttribute("update_time_" + map);
		}
		// �ý����� ����ð��� current_time�� ����
		long current_time = System.currentTimeMillis();
		// �����ð��� ��� �� ��ȸ�� ���� ó�� 24*60*60*1000(24�ð�)
		// �ý�������ð� - �����ð� > �����ð�(��ȸ�� ������ �����ϵ��� ������ �ð�)
		if (current_time - update_time > 24*60*60*1000) {
			dao.kcount(map);
			// ���ǿ� �ð��� ���� : "update_time_"+ntno�� �ٸ������� �ߺ����� �ʰ� ����� ��
			session.setAttribute("update_time_" + map, current_time);

		}
	}
}