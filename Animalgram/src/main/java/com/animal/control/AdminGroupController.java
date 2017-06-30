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
}
