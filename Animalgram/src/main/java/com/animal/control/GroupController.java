package com.animal.control;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.animal.domain.GroupVO;
import com.animal.service.GroupService;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Inject
	GroupService service;

	@Resource
	String path;

	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("grouplist", service.selectTen());
		return "user/group/group_list";
	}

	@RequestMapping("/confirm")
	public String cont() {
		
		return "user/group/group_confirm";
	}

	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public String input(GroupVO vo, MultipartFile file) throws Exception {

		String fileName = file.getOriginalFilename();
		FileUpload.fileUpload(file, path, fileName);

		vo.setGimage("/resources/image/group/" + fileName);
		service.insert(vo);
		return "redirect:/group/list";
	}

	@RequestMapping("/info")
	public String info(Model model, int gno) {
		model.addAttribute("groupVO", service.selectId(gno));
		return "user/group/group_info";
	}

	@RequestMapping("/modify")
	public String modi(Model model, int gno) {
		model.addAttribute("groupVO", service.selectId(gno));
		return "user/group/group_modify";
	}

	@RequestMapping("/update")
	public String update(GroupVO vo, int gno) {
		vo.setGno(gno);
		service.update(vo);
		return "redirect:/group/list";
	}

	@RequestMapping("/delete")
	public String delete(int gno) {
		service.delete(gno);
		return "redirect:/group/list";
	}

}
