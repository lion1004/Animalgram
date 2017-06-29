package com.animal.control;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.aspectj.ajdt.internal.compiler.ast.AddAtAspectJAnnotationsVisitor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.animal.domain.GroupVO;
import com.animal.persistence.GroupDAO;
import com.animal.service.GroupService;

@Controller
@RequestMapping("/group")
public class GroupController {
		
	@Inject
	GroupService service;
	
	@RequestMapping("/list")
	public String list(Model model) {		
		model.addAttribute("grouplist", service.selectTen());
		return "user/group/group_list";
	}
	@RequestMapping("/cont")
	public String cont() {
		return "user/group/group_confirm";
	}
	
	@RequestMapping("/input")
	public String input(GroupVO vo) {
		service.insert(vo);
		return "redirect:/group/list";
	}
	@RequestMapping("/info")
	public String info(Model model,int gno) {
		model.addAttribute("groupVO",service.selectId(gno));
		return "user/group/group_info";
	}
	@RequestMapping("/modi")
	public String modi(GroupVO vo) {
		service.update(vo);
		return "user/group/group_modify";
	}
}
