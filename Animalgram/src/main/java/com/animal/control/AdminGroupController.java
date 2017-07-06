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

import com.animal.domain.CustomVO;
import com.animal.domain.GroupVO;
import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.AdminGroupService;

@Controller
@RequestMapping("/admin/*")
public class AdminGroupController {
	
	@Inject
	AdminGroupService service;
	
	@RequestMapping("/gro_list")
	public String listGroup(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session) throws Exception{
		/*
		if(session.getAttribute("admin")==null){
			rttr.addFlashAttribute("msg","로그인을 해야합니다");
			return "redirect:/admin/login";
		}
		 */
		List<GroupVO> groupList = service.listGroup(cri);
		model.addAttribute("list",groupList);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.groupCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/group/ad_group_list";
	}
	
	@RequestMapping("/gro_delete")
	public @ResponseBody String boardDelete(@RequestParam(value="gno", required=true)List<Integer>list){
		if(service.deleteGroup(list)>0){
			return "삭제 성공";
		}else{
			return "삭제 실패";
		}
	}
	
	@RequestMapping(value="/gro_modify",method=RequestMethod.GET )
	public String groupUpform(SearchCriteria cri,Model model,int gno){
		model.addAttribute("cri",cri);
		GroupVO vo = service.selectGroup(gno);
		model.addAttribute("group",vo);
		return "admin/group/ad_group_modify";
	}
	
	@RequestMapping(value="/gro_modify",method=RequestMethod.POST)
	public String groupUpdate(RedirectAttributes rttr,SearchCriteria cri,
			GroupVO vo){
		if(service.updateGroup(vo)==1){

			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("perPageNum",cri.getPerPageNum());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("searchType",cri.getSearchType());
			rttr.addFlashAttribute("msg",vo.getGno()+"번 소모임 수정");
			return "redirect:/admin/gro_list";
		}else{
			rttr.addFlashAttribute("msg","수정 실패");
			return "redirect:/admin/gro_modify";
		}
	}
}
