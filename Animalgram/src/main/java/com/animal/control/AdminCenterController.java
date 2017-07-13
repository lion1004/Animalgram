package com.animal.control;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.AdminCenterService;

@Controller
@RequestMapping("/admin/*")
public class AdminCenterController {
	
	@Inject
	AdminCenterService service;
	
	//센터 리스트
	@RequestMapping("/cen_list")
	public String centerList(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session){
		
		model.addAttribute("list",service.listCenter(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.centerCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/center/ad_center_list";
	}
	
	//정보창
	@RequestMapping("/cen_info")
	public String centerInfo(@ModelAttribute("cri") SearchCriteria cri,Model model,int ctno){
		CenterVO vo = service.selectCenter(ctno);
		model.addAttribute("center",vo);
		return "admin/center/ad_center_info";
	}
	
	//답변창
	@RequestMapping(value="/cen_confirm", method=RequestMethod.GET)
	public String centerReplyConfirm(@ModelAttribute("cri") SearchCriteria cri,
			@ModelAttribute("ctno") int ctno){
		return "admin/center/ad_center_confirm";
	}
	
	//답변달기
	@RequestMapping(value="/cen_confirm", method=RequestMethod.POST)
	public String centerReplyConfirmPOST(SearchCriteria cri
			,CenterReplyVO vo,RedirectAttributes rttr){
		service.insertReply(vo);
		rttr.addAttribute("ctno",vo.getCtno());
		return "redirect:/admin/cen_info";
	}
	
	//답변수정폼
	@RequestMapping(value="/cen_modify", method=RequestMethod.GET)
	public String replyUpForm(int ctno,Model model){
		List<CenterReplyVO> list = service.selectReply(ctno);
		CenterReplyVO vo = list.get(0);
		model.addAttribute("reply",vo);
		return "admin/center/ad_center_modify";
	}
	//답변수정
	@RequestMapping(value="/cen_modify", method=RequestMethod.POST)
	public String replyUpdate(CenterReplyVO vo,RedirectAttributes rttr){
		if(service.updateReply(vo) > 0){
		   rttr.addAttribute("ctno",vo.getCtno());
		   rttr.addFlashAttribute("msg","수정 성공");
		   return "redirect:/admin/cen_info";
		}else{
			rttr.addFlashAttribute("msg","수정 실패");
			return "redirect:/admin/cen_modify";
		}
	}
	
	//답변삭제
	@RequestMapping("/cen_reply_delete")
	public String replyDelete(int ctno,RedirectAttributes rttr){
		service.deleteReply(ctno);
		rttr.addAttribute("ctno",ctno);
		rttr.addFlashAttribute("msg","답변 삭제");
		return "redirect:/admin/cen_info";
	}
	
	//답변 호출
	@RequestMapping(value="/replies/all/{ctno}", method=RequestMethod.GET)
	@ResponseBody
	public List<CenterReplyVO> list(@PathVariable("ctno")int ctno){
		
		List<CenterReplyVO> list = service.selectReply(ctno);
		return list;
	}
	
	//게시글,게시글에 달린 답변 삭제
	@RequestMapping("/cen_all_delete")
	public String centerAllDelete(int ctno){
		service.deleteAllCenter(ctno);
		return "redirect:/admin/cen_list";
	}
	
}
