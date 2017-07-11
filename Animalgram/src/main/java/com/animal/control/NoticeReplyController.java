package com.animal.control;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.animal.domain.ReplyPager;
import com.animal.domain.ReplyVO;
import com.animal.service.ReplyService;

@RestController
@RequestMapping("/areply")
public class NoticeReplyController {
	
	@Inject
	private ReplyService service;
	
	// ��� ����ϱ�
	@RequestMapping(value="/rinfo", method=RequestMethod.POST)
	public ResponseEntity<String> rinsert(@RequestBody ReplyVO vo, HttpSession session){
		ResponseEntity<String> entity=null;
		try {
			String nickname = (String) session.getAttribute("user");
			vo.setNickname(nickname);
			System.out.println(vo.toString());
			service.rinsert(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// ��� ��� ���(����¡)
	@RequestMapping(value="/all/{antno}/{curPage}", method=RequestMethod.GET)
	public ModelAndView qrlist(@PathVariable("antno") int antno,@PathVariable("curPage") int curPage, ModelAndView mav, 
			HttpSession session) throws Exception{
		
		int count = service.rcount(antno);
		ReplyPager replyPager = new ReplyPager(count, curPage);
		int start = replyPager.getPageBegin();
		int end = replyPager.getPageEnd();
		
		String user = (String)session.getAttribute("user");
		
		List<ReplyVO> list = service.rlist(antno,start, end);
		mav.setViewName("user/reply/reply_list");
		mav.addObject("user",user);
		mav.addObject("list",list);
		mav.addObject("replyPager", replyPager);
		return mav;
	}
	
	// ��� ���� �о����
	@RequestMapping(value = "/detail/{arno}", method = RequestMethod.GET)
	public ModelAndView rread(@PathVariable("arno") int arno, ModelAndView mav,HttpSession session) throws Exception {
		ReplyVO vo = service.rread(arno);
		String user = (String)session.getAttribute("user"); 
		// ���̸� ����
		mav.setViewName("user/reply/reply_modify");
		// �信 ������ ������ ����
		mav.addObject("user",user);
		mav.addObject("vo", vo);
		// replyDetail.jsp�� ������
		return mav;
	}
	
	// ��� �����ϱ�
	@RequestMapping(value="/rupdate/{arno}", method={RequestMethod.PUT})
	public ResponseEntity<String> rupdate(@PathVariable("arno") int arno,@RequestBody ReplyVO vo){
		ResponseEntity<String> entity=null;
		try {
			vo.setArno(arno);
			System.out.println("���� ���� "+vo.toString());
			service.rupdate(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// ��� ����
	@RequestMapping(value="/rremove/{arno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> rrmove(@PathVariable("arno") int arno){
		ResponseEntity<String> entity=null;
		try {
			service.rremove(arno);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}