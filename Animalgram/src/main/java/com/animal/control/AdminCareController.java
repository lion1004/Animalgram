package com.animal.control;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.animal.domain.CareVO;
import com.animal.domain.MemberVO;
import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.AdminCareService;

@Controller
@RequestMapping("/admin/*")
public class AdminCareController {
	
	@Inject
	AdminCareService service;
	
	@RequestMapping("/care_list")
	public String careList(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session){
		
		model.addAttribute("list",service.listCare(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.careCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/care/ad_care_list";
	}
	
	@RequestMapping("/care_delete")
	public @ResponseBody String careDelete(@RequestParam(value="cno", required=true)List<Integer>list){
		if(service.deleteCare(list)>0){
			return "삭제 성공";
		}else{
			return "삭제 실패";
		}
	}
	
	@RequestMapping(value="/care_modify",method=RequestMethod.GET )
	public String careUpform(SearchCriteria cri,Model model,int cno){
		model.addAttribute("cri",cri);
		CareVO vo = service.selectCare(cno);
		model.addAttribute("care",vo);
		return "admin/care/ad_care_modify";
	}
	
	@RequestMapping(value="/care_modify",method=RequestMethod.POST)
	public String careUpdate(RedirectAttributes rttr,SearchCriteria cri,
			CareVO vo){
		if(service.updateCare(vo)==1){

			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("searchType",cri.getSearchType());
			rttr.addFlashAttribute("msg",vo.getCno()+"번 훈련 수정");
			return "redirect:/admin/care_list";
		}else{
			rttr.addFlashAttribute("msg","수정 실패");
			return "redirect:/admin/care_modify";
		}
	}
	
}
