package com.animal.control;


import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.animal.domain.GroupPersonVO;
import com.animal.domain.GroupVO;
import com.animal.service.AnimalService;
import com.animal.service.GroupService;
import com.animal.service.MemberConfirmSer;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Inject
	private GroupService service;
	@Inject
	private AnimalService aniservice;
	
	@Resource(name = "uploadPath")
	String path;

	@RequestMapping("/list")
	public String list(Model model, HttpSession session) throws Exception{
		String nickname = (String) session.getAttribute("user");
		model.addAttribute("grouplist", service.selectTen());		
		if(nickname!=null){
			model.addAttribute("petlist", aniservice.selecAni(nickname));
		}
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


	@RequestMapping("/group_join")
	public ResponseEntity<String> groupjoin(GroupPersonVO vo,int gno)throws Exception{
		ResponseEntity<String> entity = null;
		int t = service.joinPerGroupsel(vo);
		if(t == 0){
			entity = new ResponseEntity<String>(HttpStatus.OK);
			service.insertPerGroup(vo);
			GroupVO gvo = (GroupVO)service.selectId(gno);
			gvo.setGcount(gvo.getGcount()+1);
			service.update(gvo);
		}else{
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/info")
	public String info(Model model, int gno,HttpSession session) throws Exception {
		String nickname = (String) session.getAttribute("user");	
		if(nickname!=null){
			model.addAttribute("petlist", aniservice.selecAni(nickname));
		}
		model.addAttribute("groupVO", service.selectId(gno));
		model.addAttribute("joinlist", service.selectPerGroRoom(gno));
		model.addAttribute("memanilist", service.selectperRoomper(service.selectPerGroRoom(gno)));
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
		vo.setGcount(service.joinPerGroup(gno));
		service.update(vo);
		return "redirect:/group/list";
	}

	@RequestMapping("/delete")
	public String delete(int gno) {
		service.delete(gno);
		return "redirect:/group/list";
	}

}
