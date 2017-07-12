package com.animal.control;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.animal.domain.CareVO;
import com.animal.service.CareService;

@Controller
@RequestMapping("/care")
public class CareController {

	@Inject
	CareService service;
	
	@Resource(name = "uploadPath")
	String path;

	
	@RequestMapping("/cal")
	public String cal(Model model) {
		model.addAttribute("carelist", service.selectTen());
		model.addAttribute("prolist", service.selectProp());
		model.addAttribute("memlist", service.selectProm());
		
		return "user/care/care_cal";
	}
	@RequestMapping("/confirm")
	public String confirm(Model model) {
		model.addAttribute("carelist", service.selectTen());
		return "user/care/care_confirm";
	}
	@RequestMapping(value="/input",method = RequestMethod.POST)
	public String input(CareVO vo, MultipartFile file) throws Exception {
		
		  String fileName = file.getOriginalFilename(); 
		  FileUpload.fileUpload(file, path, fileName);

        vo.setCimage("/resources/image/group/"+fileName);
		service.insert(vo);
		return "redirect:/care/cal";
	}
	
	@RequestMapping("/info")
	public String info(Model model,int cno) {
		model.addAttribute("careVO",service.selectCareInfoc(cno));
		model.addAttribute("professionalVO",service.selectCareInfop(cno));
		model.addAttribute("memberVO",service.selectCareInfom(cno));
		return "user/care/care_info";
	}
}
