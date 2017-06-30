package com.animal.control;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.AdminBoardService;

@Controller
@RequestMapping("/admin/*")
public class AdminBoardController {
	
	@Inject
	AdminBoardService service;
	
	@RequestMapping("/question")
	public String questionList(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session){
		/*
		if(session.getAttribute("admin")==null){
			rttr.addFlashAttribute("msg","로그인을 해야합니다");
			return "redirect:/admin/login";
		}
		 */
		model.addAttribute("list",service.listQuestion(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.questionCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/question/ad_question_list";
	}
	
	@RequestMapping("/knowhow")
	public String knowhowList(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session){
		/*
		if(session.getAttribute("admin")==null){
			rttr.addFlashAttribute("msg","로그인을 해야합니다");
			return "redirect:/admin/login";
		}
		 */
		model.addAttribute("list",service.listKnowhow(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.knowhowCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/knowhow/ad_knowhow_list";
	}
	
	@RequestMapping("/board_delete")
	public @ResponseBody String boardDelete(@RequestParam(value="antno", required=true)List<Integer>list){
		if(service.deleteBoard(list)>0){
			return "삭제 성공";
		}else{
			return "삭제 실패";
		}
	}
	
	@RequestMapping("/todayBoard")
	public @ResponseBody int todayBoard(){
		return service.todayBoard();
	}
	
	
}
