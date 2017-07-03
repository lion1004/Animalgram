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
	
}