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

import com.animal.domain.BlacklistVO;
import com.animal.domain.MemberVO;
import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.AdminMemberService;

@Controller
@RequestMapping("/admin/*")
public class AdminMemberController {

	@Inject
	AdminMemberService service;

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		return "admin/login/ad_login";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginSuccess(String idmail,String mpass,
			HttpSession session,RedirectAttributes rttr){
		//System.out.println(idmail + ":" + mpass);
		MemberVO member = service.adminLogin(idmail, mpass);
		if(member!=null){
			session.setAttribute("admin", member);
			return "redirect:/admin/main";
		}else{ //로그인 실패
			rttr.addFlashAttribute("msg","로그인 실패");
			return "redirect:/admin/login";
		}
	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/admin/login";
	}

	@RequestMapping("/main")
	public String main(HttpSession session,RedirectAttributes rttr){
		MemberVO admin = (MemberVO) session.getAttribute("admin");
		if(admin==null){
			rttr.addFlashAttribute("msg","로그인을 해야합니다");
			return "redirect:/admin/login";
		}
		return "admin/base/ad_main";
	}

	@RequestMapping("/mem_list")
	public String listMember(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session) throws Exception{
		/*
		if(session.getAttribute("admin")==null){
			rttr.addFlashAttribute("msg","로그인을 해야합니다");
			return "redirect:/admin/login";
		}
		 */
		List<MemberVO> memlist = service.listMember(cri);
		for(int i = 0; i < memlist.size(); i++){
			if(service.checkBlack(memlist.get(i).getMno())){
				memlist.get(i).setListCheck(true);
			}
		}
		model.addAttribute("list",memlist);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.memberCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/member/ad_member_list";
	} //회원목록

	@RequestMapping(value="/mem_modify", method=RequestMethod.GET)
	public String modifyForm(SearchCriteria cri,Model model,int mno){
		model.addAttribute("cri",cri);
		MemberVO vo = service.selectMember(mno);
		model.addAttribute("amember",vo);
		return "admin/member/ad_member_modify";
	}

	@RequestMapping(value="/mem_modify", method=RequestMethod.POST)
	public String modifyMember(RedirectAttributes rttr,SearchCriteria cri,
			MemberVO vo){
		if(service.updateMember(vo)==1){

			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("searchType",cri.getSearchType());
			rttr.addFlashAttribute("msg",vo.getMno()+"번 회원 수정");
			return "redirect:/admin/mem_list";
		}else{
			rttr.addFlashAttribute("msg","수정 실패");
			return "redirect:/admin/mem_modify";
		}
	}

	@RequestMapping("/mem_delete")
	public @ResponseBody String deleteMemeber(Model model,
			@RequestParam(value="mno",required=true) List<Integer> list){
		String message = "[";
		if(service.deleteMember(list) > 0){
			for(int i = 0; i < list.size(); i++){
				if(i < list.size()-1){
					message += list.get(i)+",";
				}else if(i == list.size()-1){
					message += list.get(i)+"]번 회원";
				}
			}
			return message+"삭제";
		}else{
			return "삭제 실패";
		}
	}

	@RequestMapping("/mem_addBlack")
	public @ResponseBody String addBlackList(
			@RequestParam(value="mno",required=true) List<Integer> list,
			@RequestParam(value="lcause", required=true)String lcause){

		String str = "";
		for(int i=0; i < list.size(); i++ ){
			if(service.checkBlack(list.get(i))){
				str += list.get(i)+" ";
			}
		}
		if(str.length()!=0){
			str += "번은 이미 제재된 회원입니다";
			return str;
		}
		
		String message = "[";
		for(int i=0; i < list.size(); i++ ){
			BlacklistVO vo = new BlacklistVO();
			vo.setMno(list.get(i));
			vo.setLcause(lcause);
			if(service.addBlack(vo) > 0){
				if(i < list.size()-1){
					message += list.get(i)+",";
				}else if(i == list.size()-1){
					message += list.get(i)+"]번 회원";
				}
			}
		}

		return message+" 블랙리스트 기재";		
	}

	@RequestMapping("/mem_black")
	public String blackList(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session){
		/*
		if(session.getAttribute("admin")==null){
			rttr.addFlashAttribute("msg","로그인을 해야합니다");
			return "redirect:/admin/login";
		}
		 */
		model.addAttribute("list",service.listBlack(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.blackCount(cri));

		model.addAttribute("pageMaker",pageMaker);

		return "admin/member/ad_member_black";
	}

	@RequestMapping("/mem_black_delete")
	public @ResponseBody String deleteBlack(
			@RequestParam(value="lno",required=true) List<Integer> list){
		String message = "[";
		if(service.deleteBlack(list) > 0){
			for(int i = 0; i < list.size(); i++){
				if(i < list.size()-1){
					message += list.get(i)+",";
				}else if(i == list.size()-1){
					message += list.get(i)+"]번 회원";
				}
			}
			return message+"제재 해제";
		}else{
			return "삭제 실패";
		}
	}
	
	@RequestMapping("/todayUser")
	public @ResponseBody int todayUser(){
		return service.todayUser();
	}

}
