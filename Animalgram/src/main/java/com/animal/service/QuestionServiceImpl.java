package com.animal.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.animal.domain.NoticeTextVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.QuestionDAO;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Inject
	private QuestionDAO dao;
	
	@Override
	public int qinsert(NoticeTextVO vo) throws Exception {		// �Խñ� �ۼ�
		return dao.qinsert(vo);
	}

	@Override
	public void qupdate(NoticeTextVO vo) throws Exception {		// �Խñ� ����
		dao.qupdate(vo);
	}

	@Override
	public void qremove(Map<String, Object> map) throws Exception {	// �Խñ� ����
		dao.qremove(map);
	}
	
	@Override
	public NoticeTextVO qread(Map<String, Object> map) throws Exception {	// �Խñ� �ϳ� �о����
		return dao.qread(map);
	}
	
	@Override
	public List<NoticeTextVO> qlist(SearchCriteria cri) throws Exception {	// �Խñ� ���
		return dao.qlist(cri);
	}

	@Override
	public int qlistcount(SearchCriteria cri) throws Exception {	// �Խñ� �� ����(����¡)
		return dao.qlistcount(cri);
	}

	@Override
	public void qcount(Map<String, Object> map, HttpSession session) throws Exception {	// �Խñ� ��ȸ��(�ߺ�����)
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
			dao.qcount(map);
			// ���ǿ� �ð��� ���� : "update_time_"+ntno�� �ٸ������� �ߺ����� �ʰ� ����� ��
			session.setAttribute("update_time_" + map, current_time);
		}
	}
}