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
import com.animal.domain.CustomVO;
import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.AdminCustomService;

@Controller
@RequestMapping("/admin/*")
public class AdminCustomController {
	
	@Inject
	AdminCustomService service;
	
	@RequestMapping("/cus_list")
	public String customList(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session){
		
		model.addAttribute("list",service.listCustom(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.customCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/custom/ad_custom_list";
	}
	
	@RequestMapping("/cus_delete")
	public @ResponseBody String customDelete(@RequestParam(value="cuno", required=true)List<Integer>list){
		System.out.println(list.get(0));
		if(service.deleteCustom(list)>0){
			return "삭제 성공";
		}else{
			return "삭제 실패";
		}
	}
	
	@RequestMapping(value="/cus_modify",method=RequestMethod.GET )
	public String careUpform(SearchCriteria cri,Model model,int cuno){
		model.addAttribute("cri",cri);
		CustomVO vo = service.selectCustom(cuno);
		model.addAttribute("custom",vo);
		return "admin/custom/ad_custom_modify";
	}
	
	@RequestMapping(value="/cus_modify",method=RequestMethod.POST)
	public String careUpdate(RedirectAttributes rttr,SearchCriteria cri,
			CustomVO vo){
		if(service.updateCustom(vo)==1){

			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("searchType",cri.getSearchType());
			rttr.addFlashAttribute("msg",vo.getCuno()+"번 주문제작 수정");
			return "redirect:/admin/cus_list";
		}else{
			rttr.addFlashAttribute("msg","수정 실패");
			return "redirect:/admin/cus_modify";
		}
	}
	
}