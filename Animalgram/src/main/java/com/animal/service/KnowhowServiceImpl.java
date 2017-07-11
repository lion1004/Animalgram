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
	public int kinsert(NoticeTextVO vo) throws Exception {		// 게시글 작성
		System.out.println("serv"+vo);
		return dao.kinsert(vo);
		
	}

	@Override
	public void kupdate(NoticeTextVO vo) throws Exception {		// 게시글 수정
		dao.kupdate(vo);
	}

	@Override
	public void kremove(Map<String, Object> map) throws Exception {	// 게시글 삭제
		dao.kremove(map);
	}
	
	@Override
	public NoticeTextVO kread(Map<String, Object> map) throws Exception {	// 게시글 하나 읽어오기
		return dao.kread(map);
	}
	
	@Override
	public List<NoticeTextVO> klist(SearchCriteria cri) throws Exception {	// 게시글 목록
		return dao.klist(cri);
	}

	@Override
	public int klistcount(SearchCriteria cri) throws Exception {	// 게시글 총 갯수(페이징)
		return dao.klistcount(cri);
	}

	@Override
	public void kcount(Map<String, Object> map, HttpSession session) throws Exception {	// 게시글 조회수(중복방지)
		long update_time = 0;
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X
		if (session.getAttribute("update_time_" + map) != null) {
			// 세션에서 읽어오기
			update_time = (long) session.getAttribute("update_time_" + map);
		}
		// 시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if (current_time - update_time > 24*60*60*1000) {
			dao.kcount(map);
			// 세션에 시간을 저장 : "update_time_"+ntno는 다른변수와 중복되지 않게 명명한 것
			session.setAttribute("update_time_" + map, current_time);

		}
	}
}