package com.animal.control;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.animal.domain.Criteria;
import com.animal.domain.NoticeTextVO;
import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.KnowhowService;
import com.animal.service.QuestionService;

@Controller
@RequestMapping("/aboard")
public class NoticeBoardController {

	@Inject
	private KnowhowService kservice;
	@Inject
	private QuestionService qservice;
	
	
	//summernote 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String imageUpload(MultipartFile image, HttpServletRequest request) throws Exception{

		String real = request.getSession().getServletContext().getRealPath("/");
		String path = "resources/img/"+image.getOriginalFilename();

		System.out.println("real: " + real);
		System.out.println("path: " + path);

			File file = new File(real + path);
			if (!file.exists()) {
				file.mkdirs();
			}
			image.transferTo(file);

		return "/" + path;
	}
	
	// 노하우 게시글 입력창 오픈
	@RequestMapping(value = "/kinsert", method = RequestMethod.GET)
	public String knowhowinsertGET() throws Exception {
		return "user/knowhow/knowhow_confirm";
	}

	// 노하우 게시글 입력
	@RequestMapping(value = "/kinsert", method = RequestMethod.POST)
	public String knowhowinsertPOST(NoticeTextVO vo, HttpServletRequest request, Model model) throws Exception {
		kservice.kinsert(vo);
		return "redirect:/aboard/klist";
	}

	// 질문답변 게시판 목록 출력 (페이징)
	@RequestMapping(value = "/klist", method = RequestMethod.GET)
	public String knowhowlist(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", kservice.klist(cri));
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(kservice.klistcount(cri));
		model.addAttribute("pageMaker", maker);
		return "user/knowhow/knowhow_list";
	}

	// 게시글 읽기
	@RequestMapping(value = "/kinfo")
	public ModelAndView knowhowinfo(@RequestParam("ntno") int ntno, @RequestParam("nno") int nno, Model model,
			SearchCriteria cri,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("ntno", ntno);
		map.put("nno", nno);
		
		kservice.kcount(map, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/knowhow/knowhow_info");
		mav.addObject("noticetextVO", kservice.kread(map));
		mav.addObject("cri", cri);
		return mav;
	}

	// 게시글 수정 읽어오기
	@RequestMapping(value = "/kupdate", method = RequestMethod.GET)
	public String knowhowupdateGET(@RequestParam("ntno") int ntno, @RequestParam("nno") int nno, Model model,
			SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("ntno", ntno);
		map.put("nno", nno);
		model.addAttribute("noticetextVO", kservice.kread(map));
		model.addAttribute("cri", cri);
		return "user/knowhow/knowhow_modify";
	}

	// 게시글 수정
	@RequestMapping(value = "/kupdate", method = RequestMethod.POST)
	public String knowhowupdatePOST(NoticeTextVO vo) throws Exception {
		System.out.println(vo);
		kservice.kupdate(vo);
		return "redirect:/aboard/klist";
	}

	// 게시글 삭제
	@RequestMapping(value = "/kremove", method = RequestMethod.POST)
	public String knowhowdelete(int ntno, int nno, Criteria cri, RedirectAttributes attr) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("ntno", ntno);
		map.put("nno", nno);
		kservice.kremove(map);
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/aboard/klist";
	}
	/*===========================================================================================================*/
	
	// 질문답변 게시글 입력창 오픈
	@RequestMapping(value = "/qinsert", method = RequestMethod.GET)
	public String questioninsertGET() throws Exception {
		return "user/question/question_confirm";
	}
	
	// 질문답변 게시글 입력
	@RequestMapping(value = "/qinsert", method = RequestMethod.POST)
	public String questioninsertPOST(NoticeTextVO vo, HttpServletRequest request, Model model) throws Exception {
		System.out.println("질문답변 글 등록 " +vo.toString());
		qservice.qinsert(vo);
		return "redirect:/aboard/qlist";
	}
	
	// 질문답변 게시판 목록 출력 (페이징)
	@RequestMapping(value = "/qlist", method = RequestMethod.GET)
	public String questionlist(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		System.out.println("model="+model);
		model.addAttribute("list", qservice.qlist(cri));
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(qservice.qlistcount(cri));
		model.addAttribute("pageMaker", maker);
		return "user/question/question_list";
	}
	
	// 게시글 읽기
	@RequestMapping(value = "/qinfo")
	public ModelAndView questioninfo(@RequestParam("ntno") int ntno, @RequestParam("nno") int nno, Model model,
			SearchCriteria cri,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("ntno", ntno);
		map.put("nno", nno);
		
		qservice.qcount(map, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/question/question_info");
		mav.addObject("noticetextVO", qservice.qread(map));
		mav.addObject("cri", cri);
		return mav;
	}

	// 게시글 수정 읽어오기
	@RequestMapping(value = "/qupdate", method = RequestMethod.GET)
	public String questionupdateGET(@RequestParam("ntno") int ntno, @RequestParam("nno") int nno, Model model,
			SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("ntno", ntno);
		map.put("nno", nno);
		model.addAttribute("noticetextVO", qservice.qread(map));
		model.addAttribute("cri", cri);
		return "user/question/question_modify";
	}

	// 게시글 수정
	@RequestMapping(value = "/qupdate", method = RequestMethod.POST)
	public String questionupdatePOST(NoticeTextVO vo) throws Exception {
		qservice.qupdate(vo);
		return "redirect:/aboard/qlist";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/qremove", method = RequestMethod.POST)
	public String questiondelete(int ntno, int nno, Criteria cri, RedirectAttributes attr) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("ntno", ntno);
		map.put("nno", nno);
		qservice.qremove(map);
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/aboard/qlist";
	}
		
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/aboard/klist";
	}
}