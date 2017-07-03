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
import com.animal.service.AdminDonationService;

@Controller
@RequestMapping("/admin/*")
public class AdminDonationController {
	
	@Inject
	AdminDonationService service;
	
	@RequestMapping("/dona_list")
	public String donationList(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session){
		/*
		if(session.getAttribute("admin")==null){
			rttr.addFlashAttribute("msg","로그인을 해야합니다");
			return "redirect:/admin/login";
		}
		 */
		model.addAttribute("list",service.listDonation(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.donationCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/donation/ad_donation_list";
	}
	
	@RequestMapping("/dona_delete")
	public @ResponseBody String donationDelete(@RequestParam(value="dno", required=true)List<Integer>list){
		if(service.deleteDonation(list)>0){
			return "삭제 성공";
		}else{
			return "삭제 실패";
		}
	}
	
}
